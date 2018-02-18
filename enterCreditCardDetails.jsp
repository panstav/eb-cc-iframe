<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" errorPage="/error.jsp"%>
<jsp:useBean id="transactionDetails" scope="request" type="com.creditguard.common.transactions.TransactionDetails" />
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="/merchantPages/ResponsiveWebSources/includes/main.jsp" %>
<%! DecimalFormat formatter = new DecimalFormat("0.00"); %>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=9">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="expires" content="-1">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=masterPassUrl%>"></script>
        <script src="merchantPages/ResponsiveWebSources/js/<%=lang%>.js"></script>
        <script src="merchantPages/ResponsiveWebSources/js/main.js"></script>
        <script src="merchantPages/ResponsiveWebSources/js/mainMP.js"></script>
        <meta name="viewport" content="width=device-width">
        <link href="merchantPages/ResponsiveWebSources/css/normalize.css" rel="stylesheet" type="text/css" />
        <link href="merchantPages/ResponsiveWebSources/css/grid.css" rel="stylesheet" type="text/css" />
        <link href="merchantPages/ResponsiveWebSources/css/responsive.main.rtl.css" rel="stylesheet" type="text/css" />
        <%=responsiveEngCSS%>
        <title>
        <%=pageTitle%>
        </title>

        <!-- Material button with ripple -->
        <script type="text/javascript">
			jQuery(function($) {
				function createRipple(elem, y, x, cb) {
					cb = cb || function(){};
					const ripple = '<div class="circle" style="top:' + y + 'px;left:' + x + 'px;"></div>';
					const _ripple = $(ripple);

					let rippleContainer = $(elem).find('.ripple');
					if (!rippleContainer.length) rippleContainer = $(elem).parent().find('.ripple');

                    rippleContainer.append(_ripple);
					setTimeout(function() {
						_ripple.remove();
						cb();
					}, 900);
				}

				$('.mui-button, a[data-src=cancel]').mousedown(function(e) {
					const offset = $(e.target).offset();
					createRipple(e.target, e.pageY - offset.top, e.pageX - offset.left);
				});
			});
        </script>

        <style type="text/css">
            body {
                font-family: 'Roboto', sans-serif;
            }

            html body :focus {
                box-shadow: 0 0 5px 3px #18b363,0 0 0 #fff inset !important;
            }

            #sk-header {
                z-index: 1000;
            }

            .rtl #sk-header, .rtl #sk-panel {
                right: auto !important;
            }
            html body #sk-accessibility {
                margin-bottom: 0px;
            }
            html body #sk-header {
                right: auto !important;
                left: 0;
            }
            html body .block #sk-panel {
                left: 7px;
            }
            html body .container {
                padding: 3rem 2rem 2rem !important;
            }
            input[type="text"], input[type="submit"], input[type="reset"], input[type="number"], select, #cancelBtn {
                border-width: 0 0 1px 0 !important;
                border-radius: 0 !important;
            }

            * {
                box-sizing:border-box;
            }

            @-webkit-keyframes ripple {
                100% {
                    opacity: 0;
                    -webkit-transform: scale(2.5);
                    transform: scale(2.5);
                }
            }
            @keyframes ripple {
                100% {
                    opacity: 0;
                    -webkit-transform: scale(2.5);
                    transform: scale(2.5);
                }
            }

            /* form starting stylings ------------------------------- */
            .material-input-group {
                position:relative;
                margin: 1rem 0;
            }
            .material-input-group input {
                font-size:1rem;
                padding:10px 10px 10px 5px;
                display:block;
                width:100%;
                border:none;
                border-bottom:1px solid #e0e0e0;
            }
            .material-input-group input:focus {
                outline:none;
            }

            /* LABEL ======================================= */
            .material-input-group label {
                font-size:18px;
                font-weight:normal;
                position:absolute;
                pointer-events:none;
                right:5px;
                top:10px;
                transition:0.2s ease all;
                -moz-transition:0.2s ease all;
                -webkit-transition:0.2s ease all;
            }

            /* active state */
            .material-input-group input:focus ~ label, .material-input-group input:valid ~ label 		{
                top:-20px;
                font-size:14px;
            }

            /* BOTTOM BARS ================================= */
            .material-input-group .bar {
                position:relative; display:block; width:100%;
            }

            .material-input-group .bar:before, .bar:after {
                content:'';
                height:2px;
                width:0;
                bottom:1px;
                position:absolute;
                background:#18b363;
                transition:0.2s ease all;
                -moz-transition:0.2s ease all;
                -webkit-transition:0.2s ease all;
            }
            .material-input-group .bar:before {
                left:50%;
            }
            .material-input-group .bar:after {
                right:50%;
            }

            /* active state */
            .material-input-group input:focus ~ .bar:before, .material-input-group input:focus ~ .bar:after {
                width:50%;
            }

            @keyframes fall {
                from {
                    top: -10px;
                    -webkit-transform: rotate(0);
                    -moz-transform: rotate(0);
                    -ms-transform: rotate(0);
                    -o-transform: rotate(0);
                    transform: rotate(0);
                }
                to {
                    top: 110vh;
                    -webkit-transform: rotate(360deg);
                    -moz-transform: rotate(360deg);
                    -ms-transform: rotate(360deg);
                    -o-transform: rotate(360deg);
                    transform: rotate(360deg);
                }
            }

            a[data-src=cancel] input {
                color: white;
                background-color: #8f8f8f;
            }
            a[data-src=cancel] .scr-reader {
                display: none;
            }

            .mui-button {
                background: #18b363;
            }

            a[data-src=cancel],
            .mui-button {
                position: relative;
                padding: 0;
                margin: 0;
                width: 150px;
                height: 50px;
                border: none;
                color: #FFF;
                box-shadow: 0 0 10px 0.5px rgba(0, 0, 0, 0);
                -webkit-transition: all 0.15s linear;
                -moz-transition: all 0.15s linear;
                transition: all 0.15s linear;
                margin-left: 1rem;
                display: inline-block;
            }
            a[data-src=cancel]:hover,
            .mui-button:hover {
                box-shadow: 0 0 10px 0.5px rgba(0, 0, 0, 0.2);
                -webkit-transform: scale(0.98);
                -moz-transform: scale(0.98);
                -ms-transform: scale(0.98);
                -o-transform: scale(0.98);
                transform: scale(0.98);
                cursor: pointer;
            }
            a[data-src=cancel]:active, a[data-src=cancel]:focus,
            .mui-button:active, .mui-button:focus {
                outline: none;
            }
            a[data-src=cancel] .ripple,
            .mui-button .ripple {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }
            @keyframes ripple {
                from {
                    -webkit-transform: scale(0);
                    -moz-transform: scale(0);
                    -ms-transform: scale(0);
                    -o-transform: scale(0);
                    transform: scale(0);
                    opacity: 1;
                }
                to {
                    opacity: 0;
                    -webkit-transform: scale(250);
                    -moz-transform: scale(250);
                    -ms-transform: scale(250);
                    -o-transform: scale(250);
                    transform: scale(250);
                }
            }
            a[data-src=cancel] .ripple .circle,
            .mui-button .ripple .circle {
                position: absolute;
                background: rgba(251, 232, 211, 0.2);
                border: 1px solid transparent;
                border-radius: 50%;
                pointer-events: none;
                animation: ripple 0.75s 1;
                top: 50%;
                left: 50%;
            }
            a[data-src=cancel] input,
            .mui-button p {
                z-index: 1;
                font-size: 1rem;
                margin: 0;
            }
        </style>
    </head>
    <body onload="onLoad();">
        <!--  DISPLAY TRANSACTION INFORMATION -->
        <div class="container">
            <form id="masterPassForm" onsubmit="" method="POST" action="ProcessMasterPass?txId=<%=mpiTxnId%>">
                <input type="hidden" name="txId" value="<%=mpiTxnId%>" />
            </form>
            <form id="creditForm" onsubmit="return validateFormTrack2CardNo();" method="POST" action="ProcessCreditCard">
                <input type="hidden" name="txId" value="<%=mpiTxnId%>" />
                <input type="hidden" name="lang" value="<%=lang%>" />
                <input type="hidden" name="cardNumber" id="cardNumber" value="" autocomplete="off" />
                <input type="hidden" name="track2" id="track2" value="" autocomplete="off" />
                <input type="hidden" name="last4d" value="" autocomplete="off" />
                <input type="hidden" name="transactionCode" value="Phone" autocomplete="off" />
                <input type="hidden" id="listPaymentsInterestValues" name="listPaymentsInterestValues" value="<%=listPaymentsInterestValues%>" />
                <input type="hidden" id="listNumberOfPaymentsValues" name="listNumberOfPaymentsValues" value="<%=listNumberOfPaymentsValues%>" />
                <!--<input type="hidden" name="userData1" value="" />
                <input type="hidden" name="userData2" value="" />
                <input type="hidden" name="userData3" value="" />
                <input type="hidden" name="userData4" value="" />
                <input type="hidden" name="userData5" value="" />
                <input type="hidden" name="userData6" value="" />
                <input type="hidden" name="userData7" value="" />
                <input type="hidden" name="userData8" value="" />
                <input type="hidden" name="userData9" value="" />
                <input type="hidden" name="userData10" value="" />-->

                <div class="grid_12 row8">

                    <div class="material-input-group">
                        <input required type="text" id="Track2CardNo" name="Track2CardNo" maxlength="80" width="100%" dir="ltr" autocomplete="off" onkeyup="limitInput(this,80)" onchange="return validateTrack2CardNo();" disabled />
                        <span class="bar"></span>
                        <label><%=CCNumber%>:</label>
                    </div>

                    <div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
                    <div class="grid_8 row8 td_style_invalidField" id="invalidCardNumber">&nbsp;</div>
                    <div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
                    <div class="grid_8 row8 td_style_invalidField" id="invalidTrack2">&nbsp;</div>
                </div>
                <div class="grid_12 row9" style="margin: 1rem 0;">
                    <div class="grid_3 row9">
                        <%=CCExp%>:
                    </div>
                    <div class="grid_8 row9">
                        <select id="expYear" name="expYear" onchange="validateExpDateOnChange();" disabled>
                            <%=expYear%>
                        </select> -
                        <select id="expMonth" name="expMonth" onchange="validateExpDateOnChange();" disabled>
                            <option value=""></option>
                            <option value="01">01</option>
                            <option value="02">02</option>
                            <option value="03">03</option>
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </div>
                    <div class="grid_1 row9 invalid_field_place_holder">&nbsp;</div>
                    <div class="grid_8 row9 td_style_invalidField" id="invalidCardExp">&nbsp;</div>
                </div>
                <div class="grid_12 row10">

                    <div class="material-input-group" style="width: 6rem;">
                        <input required type="text" pattern="[0-9]*" name="cvv" id="cvv" maxlength="4" dir="ltr" autocomplete="off" onkeyup="limitInput(this,4)" onchange="return validateCvv();" disabled />
                        <span class="bar"></span>
                        <label>CVV:</label>
                        <img id="qm" src="merchantPages/ResponsiveWebSources/images/qm.png" onmouseover="showHideCVVhelp();" onmouseout="showHideCVVhelp();" style="cursor:pointer;" />
                        <div id="CVVhelp" style="display: none; position: absolute; z-index: 1000; border: 1px #cccccc solid; padding: 10px; background: white;">
                            <img src="merchantPages/ResponsiveWebSources/images/cvv.jpg" />
                        </div>
                    </div>

                    <div class="grid_4 row10 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
                    <div class="grid_8 row10 td_style_invalidField" id="invalidCvv">&nbsp;</div>
                </div>
                <!--
                <div class="grid_12 row11">
                    <div class="grid_1 row11 td_style_fieldName">
                        <%=cvv_wneb%>:
                    </div>
                    <div class="grid_8 row11 td_style_fieldValue">
                        <select id="cvv_wneb" name="cvv_wneb" onchange="cvv_wneb_changed();" disabled >
                            <option value=""></option>
                            <option value="0"><%=cvv_wneb_0%></option>
                            <option value="2"><%=cvv_wneb_2%></option>
                            <option value="9"><%=cvv_wneb_9%></option>
                        </select>
                    </div>
                    <div class="grid_4 row10 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
                    <div class="grid_8 row10 td_style_invalidField">&nbsp;</div>
                </div>
                -->
                <div class="grid_12 row12">

                    <div class="material-input-group">
                        <input required type="text" pattern="[0-9]*" id="personalId" name="personalId" maxlength="9" dir="ltr" autocomplete="off" onkeyup="limitInput(this,9)" onchange="return validatePersonalId()" disabled />
                        <span class="bar"></span>
                        <label><%=CCPId%>:</label>
                    </div>

                    <div class="grid_4 row12 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
                    <div class="grid_8 row12 td_style_invalidField" id="invalidPersonalId">&nbsp;</div>
                </div>

                <div id=" " style="display:<%=showPayments%>" ;>
                    <div class="grid_12 rowPayments" ;>
                        <div class="grid_4 rowPayments td_style_fieldPayments">
                            <%=numberOfPaymentsLabel%>
                        </div>
                        <div class="grid_3 rowPayments td_style_fieldValue">
                            <%=NumberOfPaymentvalue%>
                            <select id="numberOfPayments" name="numberOfPayments" style="display:<%=showSelectNumberOfPayments%>" onchange=<%=onchangeNumberOfPayments%>>
                                <%=NumberOfPaymentsOptions%>
                            </select>
                        </div>
                        <div class="grid_12 row12 td_style_invalidField" style="width: 100%;" id="invalidNumberOfPayments">&nbsp;</div>
                    </div>
                    <div class="grid_12 rowPayments" style="display:<%=showFirstAndPeriodicalPayment%>" ;>
                        <div class="grid_4 rowPayments td_style_fieldPayments">
                            <%=FirstPaymentLabel%>
                        </div>
                        <div class="grid_2 rowPayments td_style_fieldValue">
                            <div id="firstPaymentDisp" class="data_style_payment" disabled="disabled">
                                <%=getFirstPayment()%>
                            </div>
                        </div>
                        <div class="responsive_page_line_break"></div>
                        <div class="grid_4 rowPayments td_style_fieldPayments">
                            <%=periodicalPaymentLabel%>
                        </div>
                        <div class="grid_2 rowPayments td_style_fieldValue">
                            <div id="periodicalPaymentDisp" class="data_style_payment" disabled="disabled">
                                <%=getPeriodicalPayment()%>
                            </div>
                        </div>
                    </div>
                    <div class="grid_12 rowPayments" style="display:<%=showPaymentsInterest%>">
                        <div class="responsive_page_line_break"></div>
                        <div class="grid_4 rowPayments td_style_fieldPayments">
                            <%=paymentsInterestLabel%>
                        </div>
                        <div class="grid_2 rowPayments td_style_fieldValue">
                            <div id="paymentsInterestDisp" disabled="disabled" class="data_style_payment">
                                <%=paymentsInterest%>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="form_buttons" class="grid_12 row13 td_style_fieldValue">
                    <button id="submitBtn" type="submit" class="mui-button">
                        <div class="ripple"></div>
                        <p><%=formSend%></p>
                    </button>
                    <%=getCancelBtnHTML("")%>
                    <!--<input class="material-button" type="submit" id="submitBtn" value="<%=formSend%>" disabled />-->
                    <!--<input class="material-button" id="resetBtn" type="reset" value="<%=formReset%>" onclick="clearFields()" disabled />-->
                </div>

            </form>
            <div>
                <div id="form_buttons" class="td_style_fieldValue rowButtons">
                    <%=getMasterPassBtnHTML()%>
                </div>
                <%=getResponsivePaymentsHTML()%>
            </div>
            <div id="loading" class="loading_invisible">
                <p id="loadingMsg" class="loading_invisible" aria-live="polite"></p>
            </div>
            <div class="grid_12 row14" height="100%" style="max-height: 3em; text-align: center; margin-top: 3rem;">
                <img class="pci_image" width="12.1%" src="merchantPages/ResponsiveWebSources/images/pci_slice.gif" alt="pci logo" title="pci logo" />
                <img class="pci_image" width="16%" src="merchantPages/ResponsiveWebSources/images/mastercard_slice.png" alt="mastercard" title="mastercard" />
                <img class="pci_image viza_img" width="16%" src="merchantPages/ResponsiveWebSources/images/visa_slice.png" alt="visa" title="visa" />
                <div class="responsive_page_line_break"></div>
                <!-- GeoTrust True Site [tm] Smart Icon tag. Do not edit. -->
                <!-- <div class="row14 pci_image" width="16%">
                    <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="//smarticon.geotrust.com/si.js"></SCRIPT>
                </div> -->
                <!-- end GeoTrust Smart Icon tag -->
            </div>
        </div>

        <%= displayAcessibility(MerchantTerminal.accessibilityDisplayForTerminal) %>
    </body>
</html>