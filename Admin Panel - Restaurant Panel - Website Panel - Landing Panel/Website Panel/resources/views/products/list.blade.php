@include('layouts.app')

@include('layouts.header')

<div class="st-brands-page pt-5 category-listing-page <?php echo $type; ?>">

	<div class="container">

		<div class="d-flex align-items-center mb-3 page-title">

	    	<h3 class="font-weight-bold text-dark" id="title"></h3>

		</div>

		<div class="row">

			<div class="col-md-3">
				<div id="category-list"></div>
			</div>

			<div class="col-md-9">
				<div id="product-list"></div>
			</div>

		</div>

	</div>

</div>

<div id="data-table_processing" class="dataTables_processing panel panel-default" style="display: none;">
    {{trans('lang.processing')}}
</div>

@include('layouts.footer') 

<script src="https://unpkg.com/geofirestore/dist/geofirestore.js"></script>
<script src="https://cdn.firebase.com/libs/geofire/5.0.1/geofire.min.js"></script>

<script type="text/javascript">

	var firestore = firebase.firestore();
    var geoFirestore = new GeoFirestore(firestore);

	var type = '<?php echo $type; ?>';
	var id = '<?php echo $id; ?>';
	var vendorIds = [];

	var idRef= database.collection('vendor_categories').doc(id);
	var catsRef= database.collection('vendor_categories').where('publish','==',true);

    var placeholderImageRef = database.collection('settings').doc('placeHolderImage');
    var placeholderImageSrc = '';
    placeholderImageRef.get().then( async function(placeholderImageSnapshots){
        var placeHolderImageData = placeholderImageSnapshots.data();
        placeholderImageSrc = placeHolderImageData.image;
    })

    idRef.get().then( async function(idRefSnapshots){
        var idRefData = idRefSnapshots.data();
        $("#title").text(idRefData.title+' '+"{{trans('lang.products')}}");
    })

	var VendorNearBy = '';
	var DriverNearByRef = database.collection('settings').doc('RestaurantNearBy');
	DriverNearByRef.get().then(async function (DriverNearByRefSnapshots) {
        var DriverNearByRefData = DriverNearByRefSnapshots.data();
        VendorNearBy = parseInt(DriverNearByRefData.radios);
		address_lat = parseFloat(address_lat);
        address_lng = parseFloat(address_lng);
	});

    var decimal_degits = 0;
    var refCurrency = database.collection('currencies').where('isActive', '==', true);
    refCurrency.get().then(async function (snapshots) {
        var currencyData = snapshots.docs[0].data();
        currentCurrency = currencyData.symbol;
        currencyAtRight = currencyData.symbolAtRight;
        if (currencyData.decimal_degits) {
            decimal_degits = currencyData.decimal_degits;
        }
    });

	$(document).ready(function() {
    	getCategories();
    	$(document).on("click",".category-item",function(){
        	if(!$(this).hasClass('active')){
        		$(this).addClass('active').siblings().removeClass('active');
        		getProducts(type,$(this).data('category-id'));
        	}
        });
    })

    async function getCategories(){
    	catsRef.get().then( async function(snapshots){
            if(snapshots!=undefined){
               var html='';
                html=buildCategoryHTML(snapshots);
                if(html!=''){
                    var append_list = document.getElementById('category-list');
                    append_list.innerHTML=html;
					var category_id = $('#category-list .active').data('category-id');
		            if(category_id){
		            	getProducts(type,category_id);
		            }
                }
            }
        });
    }

    function buildCategoryHTML(snapshots){
    	var html='';
        var alldata=[];
        snapshots.docs.forEach((listval) => {
            var datas=listval.data();
            datas.id=listval.id;
            alldata.push(datas);
        });

        html = html+ '<div class="vandor-sidebar">';
        html = html+ '<h3>{{trans("lang.categories")}}</h3>';

        html = html+ '<ul class="vandorcat-list">';
        alldata.forEach((listval) => {
            var val=listval;
            if (val.photo!="" && val.photo!=null) {
                photo = val.photo;
            } else {
                photo = placeholderImageSrc;
            }
            if(id==val.id){
				html = html+ '<li class="category-item active" data-category-id="'+val.id+'">';
			}else{
				html = html+ '<li class="category-item" data-category-id="'+val.id+'">';
			}

            html = html +'<a href="javascript:void(0)"><span><img onerror="this.onerror=null;this.src=\'' + placeholderImageSrc + '\'" src="'+photo+'"></span>'+val.title+'</a>';
            html = html +'</li>';
		});
		html = html +'</ul>';

		return html;
     }

     async function getProducts(type,id){

		jQuery("#data-table_processing").show();

		var html = '';
		var product_list = document.getElementById('product-list');
        product_list.innerHTML = '';

		var idRef = database.collection('vendor_categories').doc(id);
        idRef.get().then( async function(idRefSnapshots){
	        var idRefData = idRefSnapshots.data();
	        $("#title").text(idRefData.title+' '+"{{trans('lang.products')}}");
	    })

		var vendorsSnapshots = await geoFirestore.collection('vendors').near({
            center: new firebase.firestore.GeoPoint(address_lat, address_lng),
            radius: VendorNearBy
        }).limit(200).where('zoneId','==',user_zone_id).get();

		if(vendorsSnapshots.docs.length > 0){

			vendorsSnapshots.docs.forEach((listval) => {
				vendorIds.push(listval.id);
			});
			
			var productsRef = database.collection('vendor_products').where('categoryID','==',id).where("publish","==",true);
			productsRef.get().then( async function(snapshots){
				if (snapshots.docs.length > 0) {
					html = buildProductsHTML(snapshots);
					product_list.innerHTML = html;
				}else{
					html = html +"<h5 class='font-weight-bold text-center mt-3'>{{trans('lang.no_results')}}</h5>";
					product_list.innerHTML = html;
				}
			});
		}else{
			html = html +"<h5 class='font-weight-bold text-center mt-3'>{{trans('lang.no_results')}}</h5>";
			product_list.innerHTML = html;
		}

		jQuery("#data-table_processing").hide();
    }

    function buildProductsHTML(snapshots){
        var html='';
        var alldata=[];
        snapshots.docs.forEach((listval) => {
            var datas=listval.data();
            datas.id=listval.id;
			if($.inArray(datas.vendorID,vendorIds) !== -1){
            	alldata.push(datas);
			}
        });

        var count = 0;
        var popularFoodCount = 0;
        html = html+ '<div class="row">';

		alldata.forEach((listval) => {
			var val=listval;
			var rating = 0;
			var reviewsCount = 0;
			if (val.hasOwnProperty('reviewsSum') && val.reviewsSum != 0 && val.hasOwnProperty('reviewsCount') && val.reviewsCount != 0) {
				rating = (val.reviewsSum / val.reviewsCount);
				rating = Math.round(rating * 10) / 10;
				reviewsCount = val.reviewsCount;
			}

			html = html+ '<div class="col-md-4 pb-3 product-list"><div class="list-card position-relative"><div class="list-card-image">';
						status='{{trans("lang.non_veg")}}';
						statusclass='closed';
						if(val.veg==true){
							status='{{trans("lang.veg")}}';
							statusclass='open';
						}
			if(val.photo!="" && val.photo!=null){
				photo=val.photo;
			}else{
				photo=placeholderImageSrc;
			}

			var view_product_details = "{{ route('productDetail',':id')}}";
			view_product_details = view_product_details.replace(':id',val.id);

			html = html +'<div class="member-plan position-absolute"><span class="badge badge-dark '+statusclass+'">'+status+'</span></div><a href="'+view_product_details+'"><img onerror="this.onerror=null;this.src=\'' + placeholderImageSrc + '\'" alt="#" src="'+photo+'" class="img-fluid item-img w-100"></a></div><div class="py-2 position-relative"><div class="list-card-body"><h6 class="mb-1"><a href="'+view_product_details+'" class="text-black">'+val.name+'</a></h6>';

			if (val.hasOwnProperty('disPrice') && val.disPrice != '' && val.disPrice != '0' && val.item_attribute == null) {
				var or_price = getFormattedPrice(parseFloat(val.price));
				var dis_price = getFormattedPrice(parseFloat(val.disPrice));
				html = html + '<span class="pro-price">' + dis_price + '  <s>' + or_price + '</s></span>';
			} else {
				if (val.item_attribute != null && val.item_attribute != "" && val.item_attribute.attributes.length > 0 && val.item_attribute.variants.length > 0) {
                    var variants_prices = [];
                    var variants = val.item_attribute.variants;
                    for(variant of variants){
                        variants_prices.push(variant.variant_price);
                    }
                    var min_price = Math.min.apply(Math,variants_prices);
                    var max_price = Math.max.apply(Math,variants_prices);
                    if(min_price != max_price){
						var or_price = getFormattedPrice(parseFloat(min_price)) + " - "+getFormattedPrice(parseFloat(max_price));
					}else{
						var or_price = getFormattedPrice(parseFloat(max_price));    
					}
                }else{
                    var or_price = getFormattedPrice(parseFloat(val.price));
                }
				html = html + '<span class="pro-price">' + or_price + '</span>'
			}

			html = html + '<div class="star position-relative mt-3"><span class="badge badge-success"><i class="feather-star"></i>' + rating + ' (' + reviewsCount + ')</span></div>';

			html = html +'</div>';
			html = html +'</div></div></div>';

		});

        html = html + '</div>';

        return html;
    }

</script>

@include('layouts.nav')
