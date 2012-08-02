$(document).ready(function(){
    
    $("#piece_selector li").click(function() {
  
        $(this).toggleClass("selected");
        
        $fields = $("<div />", {id : "hidden_fields"});
        
        $(".selected").each(function(){
           
            $field = $("<input type='hidden' />").attr({
                id: "piece_ids",
                multiple: "multiple",
                name: "outfit[piece_ids][]",
                value: $(this).val()
            });

            $fields.append($field);
        });
          
        $('#hidden_fields').replaceWith($fields);

    });
});