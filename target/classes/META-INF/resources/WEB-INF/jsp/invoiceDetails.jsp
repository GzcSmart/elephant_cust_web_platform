<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="../../../../elephant_images/favicon.png" type="image/x-icon">
    <title>大象能力平台</title>
    <%@ include file="public_css_js.jsp" %>
    <%@ include file="head_alert.jsp" %>
    <script type="text/javascript"
            src="../../../../js/elephant-userCenter/invoice/apply/invoice-apply-detail.js"></script>
    <style>
        .select_date {
            margin: 5px 0px 25px 10px;
        }

        .select_date li {
            width: 60px;
            height: 30px;
            color: #000;
            padding: 5px;
            line-height: 30px;
            float: left;
            text-align: center;
        }

        .select_date li a {
            color: #000;
            padding: 5px;
        }

        .addr_manage {
            margin: 5px 0px 25px 10px;
        }

        .addr_manage li {
            color: #000;
            padding: 5px;
            line-height: 30px;
        }

        .addr_manage li a {
            color: #000;
            padding: 5px;
        }

        .addr_manage li a:hover {
            color: #000;
            padding: 5px;
            background-color: #0099ff;
        }

        .addCustAddress {
            margin: 25px 0px 25px 20px;
        }

        .addCustAddress a {
            color: #0099ff;
            padding: 5px;
        }

        .addCustAddress a:hover {
            color: #000;
            padding: 5px;
            background-color: #0099ff;
        }

        .Mant-per {
            height: auto;
        }

        article {
            height: auto;
        }

        .Mant-personalcent {
            height: auto;
        }
    </style>
</head>
<body style="background-color: #eeeeee;">
<article>
    <div class="Mant-personalcent" style="margin: 0px;">
        <div class="Mant-per" style="margin-left: 0px; padding-top: 0px;">
            <div class="clearfix" style="margin: 0px;padding-left:25px;padding-bottom: 20px">
                <form method="post" action="">
                    <input id="id" value="" hidden/>
                    <input id="url" value="${pageContext.request.contextPath }" hidden/>
                    <div style="border-bottom: 1px solid #ddd; height: 35px; line-height: 35px; font-size: 15px;">
                        <strong>开票信息</strong>
                    </div>
                    <table width="100%" cellpadding="0" cellspacing="8" style="margin-top:10px;margin-bottom:10px;">
                        <tr style="line-height:25px;">
                            <td class="addtab_tit" style="width:18%;">发票抬头：</td>
                            <td style="width:40%;"><span id="invoiceTitle">${customerInvoiceApply.invoiceTitle}</span>
                            </td>

                            <td class="addtab_tit" style="width:18%;padding-left:10px;">开户银行：</td>
                            <td style="width:40%;"><span id="invoiceBank">${customerInvoiceApply.invoiceBank}</span>
                            </td>
                        </tr>
                        <tr style="line-height:20px;">
                            <td class="addtab_tit">营业电话：</td>
                            <td><span id="orgMobile"></span>${customerInvoiceApply.orgMobile}</td>

                            <td class="addtab_tit" style="width:18%;padding-left:10px;">银行账号：</td>
                            <td><span id="bankCardNumber">${customerInvoiceApply.bankCardNumber}</span></td>
                        </tr>
                        <tr style="line-height:20px;">
                            <td class="addtab_tit">营业地址：</td>
                            <td><span id="orgAddress">${customerInvoiceApply.orgAddress}</span></td>

                            <td class="addtab_tit" style="width:18%;padding-left:10px;">纳税人资格类型：</td>
                            <td><span id="taxType">${customerInvoiceApply.taxpayerQualification}</span></td>
                        </tr>
                        <tr style="line-height:20px;">
                            <td class="addtab_tit" style="width:18%;">税务登记号：</td>
                            <td><span id="taxRegisterNumber">${customerInvoiceApply.taxRegisterNumber}</span></td>
                        </tr>
                    </table>

                    <div style="border-bottom: 1px solid #ddd; height: 35px; line-height: 35px; font-size: 15px;">
                        <strong>发票内容</strong>
                    </div>
                    <table width="100%" cellpadding="0" cellspacing="8" style="margin-top:10px;margin-bottom:10px;">
                        <tr style="line-height:25px;">
                            <td class="addtab_tit" style="width:18%;">开票金额(元)：</td>
                            <td style="width:40%;"><span id="invoiceAmount">${customerInvoiceApply.invoiceAmount}</span>
                            </td>

                            <td class="addtab_tit" style="width:18%;padding-left:10px;">发票类别：</td>
                            <td><span id="invoiceType">${customerInvoiceApply.invoiceType}</span></td>
                        </tr>
                        <tr style="line-height:25px;">
                            <td class="addtab_tit" style="width:12%;">发票项目：</td>
                            <td style="width:40%;"><span
                                    id="invoiceCategory">${customerInvoiceApply.invoiceCategory}</span></td>

                            <td class="addtab_tit" style="width:18%;padding-left:10px;">盖章类型：</td>
                            <td><span id="stampType">${customerInvoiceApply.stampType}</span></td>
                        </tr>
                        <tr style="line-height:25px;">
                            <td class="addtab_tit" style="width:12%;">纸质账单：</td>
                            <td style="width:40%;"> <span id="needBill">
                <c:if test="${customerInvoiceApply.needBill == 0}">不需要</c:if>
                <c:if test="${customerInvoiceApply.needBill == 1}">需要</c:if>
              </span></td>

                            <td class="addtab_tit" style="width:18%;padding-left:10px;">开票日期：</td>
                            <td><span id="insertTime">${customerInvoiceApply.insertTime}</span></td>

                        </tr>
                        <tr style="line-height:25px;width: 100%">
                            <td class="addtab_tit">服务名称：</td>
                            <td colspan="3"><span id="ywCategory">${customerInvoiceApply.ywCategory}</span></td>
                        </tr>
                    </table>

                    <div style="border-bottom: 1px solid #ddd;line-height:35px;font-size:15px;margin-bottom:10px;">
                        <strong>收票地址 </strong>
                    </div>
                    <table width="100%" cellpadding="0" border="0" cellspacing="0" align="left"
                           style="border:1px solid #ececec;font-size: 14px;text-align:center; margin-bottom: 20px">
                        <tr style="line-height:35px;">
                            <td width="15%" style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">
                                收货人姓名
                            </td>
                            <td style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">收货地址</td>
                            <td style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">联系电话</td>
                        </tr>
                        <tr style="line-height:35px;">
                            <td style="border-right:1px solid #ececec;"><span
                                    id="receiver">${customerInvoiceApply.receiver}</span></td>
                            <td style="border-right:1px solid #ececec;"><span
                                    id="receivedAddress">${customerInvoiceApply.receivedAddress}</span></td>
                            <td style="border-right:1px solid #ececec;"><span
                                    id="receivedPhone">${customerInvoiceApply.receivedPhone}</span></td>
                        </tr>
                    </table>

                    <div>
                        <div style="border-bottom: 1px solid #ddd; line-height:35px;font-size:15px;margin-bottom:10px;">
                            <strong> 选中账单 </strong>
                        </div>
                        <table width="100%" cellpadding="0" border="0" cellspacing="0" align="left"
                               style="border:1px solid #ececec;font-size: 14px;text-align:center;">
                            <thead>
                            <tr style="line-height:35px;">
                                <td width="5%" style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">
                                    序号
                                </td>
                                <td width="30%" style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">
                                    账单时间
                                </td>
                                <td style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">账单金额(元)</td>
                                <td style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">业务类别</td>
                            </tr>
                            </thead>
                            <tbody id="invoiceApplyBills">
                            <td width="5%"
                                style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;">${customerInvoiceApply.billId}</td>
                            <td width="30%"
                                style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;"></td>
                            <td style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;"></td>
                            <td style="border-bottom:1px solid #ececec;border-right:1px solid #ececec;"></td>
                            </tbody>

                        </table>

                        <input hidden id="pageNumber" value="1"/>
                        <div id="page" align="center"/>
                    </div>

                    <div style="border-bottom: 1px solid #ddd;  line-height: 35px; font-size: 15px;margin-top:20px;margin-bottom:10px;">
                        <strong>审核信息</strong>
                    </div>
                    <table width="100%" cellpadding="0" cellspacing="8"
                           style="margin-top:10px;margin-bottom:10px;word-wrap: break-word;word-break: break-all">
                        <tr style="line-height:25px;">
                            <td class="addtab_tit" style="width:8%;">审核状态：</td>
                            <td style="width:40%;" id="auditStatus">${customerInvoiceApply.auditStatus}
                            </td>
                        </tr>
                        <tr style="line-height:20px;" hidden id="showAuditRemark">
                            <td class="addtab_tit">审核备注：</td>
                            <td><span id="auditRemark">${customerInvoiceApply.auditRemark}</span></td>
                        </tr>
                    </table>

                    <div class="form-group">
                        <div class="col-lg-offset-3" style="text-align: center" hidden id="showBtn">
                            <button type="button" id="btnCancel"
                                    class="btn btn-primary"><i class="fa-undo"></i> 撤销
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</article>
<script>
</script>
</body>
</html>