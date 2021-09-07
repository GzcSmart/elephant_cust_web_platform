var resetCss={
    position:'absolute',
    top:'70px',
    display:'inline-block',
    width:'130px',
    height:'30px',
    left: '0',
    padding:'5px 5px 5px 40px',
    color:'#75b9e6',
    background:'rgba(215, 222, 224, 0.8)'
};
function upload1(list,pick,imgId,basePath){
    /* document.getElementById(pick).innerHTML=""; */
    // 图片上传demo
    var $ = jQuery,
        $list = $('#'+list),
        // 优化retina, 在retina下这个值是2
        ratio = window.devicePixelRatio || 1,
        // 缩略图大小
        thumbnailWidth = 800 * ratio,
        thumbnailHeight = 600* ratio,
        // Web Uploader实例
        uploader;
    // 初始化Web Uploader
    uploader = WebUploader.create({
        // 自动上传。
        auto: true,
        duplicate:true,
        // swf文件路径
        swf:  basePath+'static/js/upload/Uploader.swf',
        // 文件接收服务端。
        server: '/imgUpload'+'?fileType=image&moduleName=orgImages',
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#'+pick,
        //限制文件大小
        fileSingleSizeLimit:1024*1024*10,
        accept: {
            title: 'Images',
            extensions: 'jpg,jpeg,png,bmp',
            mimeTypes: 'image/jpg,image/jpeg,image/png,image/bmp'
        }
    });
    $('#'+pick).children(":first").empty();
    //待定添加哈
    var imageData=$('#'+list).children().eq(0).attr("src");
    if(imageData===undefined||imageData==""){
        var dataOriginal=$('#'+list).children().eq(0).attr("data-original");
        if(dataOriginal===undefined||dataOriginal==""){
            var html="<div class=showImageDiv></div>";
        }else{
            var html="<div class=showImageDiv onclick=\"showUploadImg('"+dataOriginal+"')\"></div>";
        }
    }else{
        var html="<div class=showImageDiv onclick=\"showUploadImg('"+imageData+"')\"></div>";
    }
    $('#'+list).append(html);
    //生成提示重新上传
    $('#'+pick).children().eq(0).css('height','30px');
    $('#'+pick).children().eq(0).css('top','70px');
    $('#'+pick).children().eq(0).css('padding-top','5px');
    $('#'+pick).children().eq(0).css('color','rgb(117, 185, 230)');
    $('#'+pick).children().eq(0).append('<label>上传图片</label>');
    $('#'+pick).children().eq(1).css('height','30px');
    $('#'+pick).children().eq(1).css('top','70px');
    $('#'+pick).children().eq(1).css(resetCss);

    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
        $list.empty();
        var $li = $(
            '<div id="' + file.id + '" class="file-item thumbnail">' +
            '<img>' +
            '<div class="info">' /* + file.name  */+ '</div>' +'<div class="webuploadDelbtn"><i class=im-remove2></i></div>'+
            '</div>'
            ),
            $img = $li.find('img');
        $list.append( $li );

        // 创建缩略图
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, thumbnailWidth, thumbnailHeight );
    });
    $list.on("click",".webuploadDelbtn",function(){
        var $ele=$(this);
        var id=$ele.parent().attr("id");
        var file=uploader.getFile(id);
        uploader.removeFile(file,true);
        $('#'+pick).children().eq(1).find('input').attr('disabled',false);
        $('#'+pick).children().eq(0).children().text('重新上传');
        $('#'+imgId).val('');
        $('#'+list).empty();
    })

    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        $('#'+pick).children().eq(0).find('label').text('上传中...');
        $('#'+pick).children().eq(1).css('height','30px');
        $('#'+pick).children().eq(1).find('input').attr('disabled',true);
        /* var $li = $( '#'+file.id ),
             $percent = $li.find('.progress span');

         // 避免重复创建
         if ( !$percent.length ) {
             $percent = $('<p class="progress"><span></span></p>')
                     .appendTo( $li )
                     .find('span');
         }

         $percent.css( 'width', percentage * 100 + '%' );*/
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,response ) {
        //需要修改

        $('#'+imgId).val(response.imageId);
        $('#'+pick).children(":first").empty();
        $('#'+pick).children(":first").css('background','rgba(215, 222, 224, 0)');
        //待定添加哈
        $( '#'+file.id ).find('.progress').remove();
        $( '#'+file.id ).addClass('upload-state-done');
        //生成缩略图显示
        var imageData=$('#'+list).children().eq(0).children().eq(0);
        $('#'+list).empty();
        $('#'+list).append('<img src='+response.realPath+' width="130" height="100" style="margin:0 auto;"/>')
        var html="<div class=showImageDiv onclick=\"showUploadImg('"+response.realPath+"')\"></div>";
        $('#'+list).append(html);
        //生成提示重新上传
        $('#'+pick).children().eq(0).css('height','30px');
        $('#'+pick).children().eq(0).css('top','70px');
        /*$('#'+pick).children().eq(1).css('margin-top','0px');*/
        $('#'+pick).children().eq(1).css('height','30px');
        $('#'+pick).children().eq(1).css('top','70px');
        /*$('#'+list).find('div').find('div').css(resetCss);
        $('#'+list).find('div').find('div').html("<label>重新上传</label>");*/
        $('#'+list).find('.webuploadDelbtn').empty();
        $('#'+pick).children().eq(1).find('input').attr('disabled',false);
        $('#'+pick).children().eq(0).css('background','rgba(215, 222, 224, 0.5)')
        $('#'+pick).children().eq(0).append('<label>重新上传</label>');
        $('#secondNext').css("display", "block");
        /*  $('#'+pick).children(":first").css('color','red');  */

    });

    // 文件上传失败，现实上传出错。
    uploader.on( 'uploadError', function( file ) {
        //以下一行修改即可
        /*$('#'+imgId).val("");
        $('#'+pick).children(":first").empty();
        $('#'+pick).children(":first").css('background','rgba(215, 222, 224, 0)');
        $('#'+pick).children().eq(0).css('height','30px');
        $('#'+pick).children().eq(0).css('top','70px');
        $('#'+pick).children().eq(1).css('height','30px');
        $('#'+pick).children().eq(1).css('top','70px');
        $('#'+pick).children().eq(1).find('input').attr('disabled',false);
        $('#'+pick).children().eq(0).children().text('重新上传');*/
        /*    $('#'+list).find('div').find('span').text("");
            $('#'+list).find('div').find('span').remove();
            $('#'+list).find('div').css("padding","0px");
            $('#'+list).find('div').find('div').css(resetCss);
            $('#'+list).find('div').find('div').html("<label>重新上传</label>");*/
        /*  var $li = $( '#'+file.id ),
              $error = $li.find('div.error');

          // 避免重复创建
          if ( !$error.length ) {
              $error = $('<div class="error"></div>').appendTo( $li );
          }
          alert("adsa")
          $error.text('上传失败');*/
        layer.msg('上传文件错误请核实文件信息',{icon:2,time:1500});
        $('#'+imgId).val('');
        $('#'+list).empty();
        $('#'+pick).children().eq(0).empty();
        $('#'+pick).children().eq(0).css('background','rgba(215, 222, 224, 0.5)');
        $('#'+pick).children().eq(0).append('<label>重新上传</label>');

    });
    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').remove();
    });
    uploader.on('error', function(type,file){
        if(type=="Q_TYPE_DENIED"){
            layer.msg('上传文件格式只支持jpg,jpeg,png,bmp',{icon:2,time:1500});
        }else if(type=="F_EXCEED_SIZE"){
            layer.msg('上传文件大小超过限制，大小不能超过10M',{icon:2,time:1500});
        }else if(type=="Q_EXCEED_NUM_LIMIT"){
            layer.msg('上传数量超过1个默认上传第一个第1个',{icon:0,time:1500});
            uploader.reset();
        }else{
            layer.msg('上传文件错误请核实文件信息',{icon:2,time:1500});
        }
    });
}