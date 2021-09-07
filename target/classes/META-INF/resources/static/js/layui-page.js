/**
 * Created by Administrator on 2017/8/29.
 */
//分页处理
function showPage(data) {
    layui.use(['laypage'], function () {
        var laypage = layui.laypage;
        laypage.render({
            elem: "page",
            curr: data.pageNum,
            count: data.total,
            layout:['count','prev','page','next','skip'],
            pages: data.pages,
            theme: '#75b9e6',
            skip: true,
            jump: function (obj, first) {
                var curr = obj.curr;
                if (!first) {
                    list(curr);
                }
            }
        });
    });
}