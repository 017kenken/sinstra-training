$(function(){
    $('.delete').on('click',function(){
        let pdata = $(this).parent();
        if (!confirm('sure?')){
            return;
        }
        $.post('/destroy',{
            id: pdata.data('id'),
            //_csrf: pdatd.data('token')
        },function(){
            pdata.fadeOut(800);
            location.reload();
        });
    });
});