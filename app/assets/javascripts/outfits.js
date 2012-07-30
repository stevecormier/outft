var selected = new Array();

var fields = "";

$(document).ready(function(){
    
    $("#piece_selector li").click(function() {
  
        $(this).toggleClass("selected");
        
        selected = [];
        fields = "<div id = 'hidden_fields'>";
        
        $(".selected").each(function(){
           selected.push(this.value) 
        });

        for(var i = 0; i < selected.length; i++){
            var field = '<input id="piece_ids" multiple="multiple" name="outfit[piece_ids][]" type="hidden" value="' + selected[i] + '">'
            fields += field;
        }
        
        fields += "</div>";
        
        console.log(fields);
        
        $('#hidden_fields').replaceWith(fields)
                
    });
    

});




