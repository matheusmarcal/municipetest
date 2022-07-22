function clearModalContainer(modal_id){
    if(modal_id){
        $('#'+modal_id).modal('hide');
    }else{
        $('.modal-backdrop').remove();
        $('#editable-modal-area').html('');
    }
}

function removeModal(){
    // $('.modal').remove();
    $('.modal-backdrop').remove();
    $('body').removeClass( "modal-open" );
}

function userAlert(title,message,scope) {
    // scope = warning, error, success, info, and question
    swal(title, message, scope);
}

$( document ).ready(function() {
    setTimeout(function () {

        $(document).on("ajax:send", function () {
            $('.is_loading').show(150);
            setTimeout(function () {
                $('.is_loading').hide(150);
                try { loadLegacyScripts(); }catch (e) {}
            },1000);
        });
        $(document).ajaxSuccess(function () {
            try { loadLegacyScripts(); }catch (e) {}
        });
        $(document).ajaxComplete(function () {
            try { loadLegacyScripts(); }catch (e) {}
        });
    },500);
});
