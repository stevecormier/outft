
function sync_svpply(){
    
    var pieces = new Array();
    var svpply_url = "https://api.svpply.com/v1/users/stevecormier/owns/products.json"
    
    $.ajax({
        url: svpply_url,
        dataType: 'jsonp',
        success: function(results){
            console.log(results);
            
            $.each(results.response.products, function(i,product){
            			   if(product.category == "apparel" || product.category == "accessories"){
            			       var piece = {"name": product.page_title,
            			                    "image": product.image,
            			                    "link": product.store.url,
            			                    }
            			                    
            			        pieces.push(piece);
            			   }
            });
        }
    });


    //TODO: use JSON to get "current_user" variable
    jQuery.ajax({
        async:true,
        type: "POST",
        url:("/users/steve/multiple_create/"),
        data: {"pieces": pieces},
        dataType: "script"    
    });
};