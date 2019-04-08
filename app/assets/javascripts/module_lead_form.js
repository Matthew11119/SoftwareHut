$('document').ready(function() {
    
    $("#form-ready-screen").on("ajax:success", (event)=>alert('good'));
    $("#form-ready-screen").on("ajax:error", (event)=>alert('bad'));


    $('#label-help').text("Select a student below to begin examination");

    $(".item-form:contains('Remaining')").css({
        "font-weight":"bold",
        "color":"#22A7F0"
    })

    $(".item-form:contains('Remaining')").click(function() {
        $(".item-form:contains('Remaining')").css({
            "font-weight":"bold",
            "color":"#22A7F0"
        });
        $(".item-form:contains('Completed')").css({
            "font-weight":"normal",
            "color":"#777"
        });
    })

    $(".item-form:contains('Completed')").click(function() {
        $(".item-form:contains('Remaining')").css({
            "font-weight":"normal",
            "color":"#777"
        })
        $(".item-form:contains('Completed')").css({
            "font-weight":"bold",
            "color":"#22A7F0"
        })
    });
    

});