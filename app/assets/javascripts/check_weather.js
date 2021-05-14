// In your Javascript (external .js resource or <script> tag)
$(document).on('turbolinks:load',function() {
    $('.js-example-placeholder-single').select2({
        // Placeholder for searchbar
        placeholder: "Select a city",
        // Allow searchbar to be cleared
        allowClear: true,
        // If typed in string does not have option, then add to option list
        tags: true
    });

    $('#button').click(function(){
        var city_name_param = $('#city_name option:selected').text();
    
        window.location = "http://localhost:3000/show_weather?city_name_param=" + city_name_param;
        
      });
    
});