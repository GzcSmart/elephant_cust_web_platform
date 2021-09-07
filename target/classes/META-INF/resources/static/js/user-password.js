function openCustomer() {
    var screenWidth = document.documentElement.clientWidth;
    if (screenWidth > 780) {
        screenWidth = 780;
    } else {
        screenWidth = screenWidth * 0.9;
    }
    layer.open({
        type: 2,
        title: ['<i class="fa-user"/>&nbsp;个人资料', 'font-size:16px;font-weight:bold;color:RGB(118,131,153)'],
        shadeClose: false,
        shade: 0.4,
        //maxmin: true,
        area: [screenWidth + 'px', '65%'],
        content: '/getCustomerInfo'
    });
}