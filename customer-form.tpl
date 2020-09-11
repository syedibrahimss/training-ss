{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA 
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='customer_form'}
  {block name='customer_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

<script type="text/javascript" src="{$urls.js_url}custom-account.js" ></script>

<form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form" method="post">
  <section>
	
    



            {block "form_fields"}
            
              {foreach from=$formFields item="field"}
              
                {block "form_field"}
                
                  {form_field field=$field}
                {/block}
              {/foreach}
              {$hook_create_account_form nofilter}
            {/block}
  </section>

  {block name='customer_form_footer'}
    <footer class="form-footer clearfix" id="form-save-option" style="display:none!important;">
      <input type="hidden" name="submitCreate" value="1">
      <input type="hidden" name="sap" value="0">
      <input type="hidden" name="id_pricing_list"  id="id_pricing_list" value="0">
      <input type="hidden" name="payment_terms" id="payment_terms"  value="COD">
      <input type="hidden" name="po_required"  id="po_required"  value="Y">
      {block "form_buttons"}
        <button class="btn btn-primary form-control-submit float-xs-right" data-link-action="save-customer" type="submit" onclick=" return accountValidation_r()">
          {l s='Submit' d='Shop.Theme.Actions'}
        </button>
      {/block}
    </footer>
  {/block}

</form>
{/block}

<!-- The Modal -->
  <div class="modal fade" id="accountModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title"></h5>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style='color:red;'>
          
        </div>
        
      </div>
    </div>
  </div>
<script>

function ready(callback){
    // in case the document is already rendered
    if (document.readyState!='loading') callback();
    // modern browsers
    else if (document.addEventListener) document.addEventListener('DOMContentLoaded', callback);
    // IE <= 8
    else document.attachEvent('onreadystatechange', function(){
        if (document.readyState=='complete') callback();
    });
}

ready(function(){
    // do something
    
onlineAccountActivation();
Customacc(1);
    var newsletter = document.getElementById("newslette").innerHTML;
    var term = document.getElementById("term").innerHTML;

    
        document.getElementById("term").innerHTML = newsletter;
        document.getElementById("newslette").innerHTML = term;
        $("#lastname").appendTo("#fistname_det");
        //document.getElementById("lastname").appendTo("#fistname_det");
        document.getElementById("lastname_det").remove();
		if ($("input[name='id_miro']:checked").val() == '1') {
                document.getElementById("div_p_miri_account").style.display="block";
				var acount_type=document.getElementById("acount_type").value;
				if(acount_type=="5"){
					document.getElementById("form-address-inner").style.display="none";
				}else{
					document.getElementById("form-address-inner").style.display="block";
				}
				document.getElementsByName("address1")[0].required = false;
				document.getElementsByName("address2")[0].required = false;
				document.getElementsByName("suburb")[0].required = false;
				document.getElementsByName("city")[0].required = false;
				document.getElementsByName("province")[0].required = false;
				document.getElementsByName("postcode")[0].required = false;
				document.getElementsByName("billaddress1")[0].required = false;
				document.getElementsByName("billaddress2")[0].required = false;
				document.getElementsByName("bsuburb")[0].required = false;
				document.getElementsByName("billcity")[0].required = false;
				document.getElementsByName("billprovince")[0].required = false;
				document.getElementsByName("billzipcode")[0].required = false;
            }
            if ($("input[name='id_miro']:checked").val() == '0') {
                document.getElementById("div_p_miri_account").style.display="none";
				document.getElementById("form-address-inner").style.display="block";
				document.getElementsByName("address1")[0].required = true;
				document.getElementsByName("address2")[0].required = false;
				document.getElementsByName("suburb")[0].required = false;
				document.getElementsByName("city")[0].required = true;
				document.getElementsByName("province")[0].required = true;
				document.getElementsByName("postcode")[0].required = true;
				document.getElementsByName("billaddress1")[0].required = true;
				document.getElementsByName("billaddress2")[0].required = false;
				document.getElementsByName("bsuburb")[0].required = false;
				document.getElementsByName("billcity")[0].required = true;
				document.getElementsByName("billprovince")[0].required = true;
				document.getElementsByName("billzipcode")[0].required = true;
                	//$("#p_miri_account").val("");
            }
        
        $('input:radio[name=id_miro]').change(function () {
            if (this.value == '1') {
                document.getElementById("div_p_miri_account").style.display="block";
				var acount_type=document.getElementById("acount_type").value;
				if(acount_type=="5"){
					document.getElementById("form-address-inner").style.display="none";
				}else{
					document.getElementById("form-address-inner").style.display="block";
				}
				document.getElementsByName("address1")[0].required = false;
				document.getElementsByName("address2")[0].required = false;
				document.getElementsByName("suburb")[0].required = false;
				document.getElementsByName("city")[0].required = false;
				document.getElementsByName("province")[0].required = false;
				document.getElementsByName("postcode")[0].required = false;
				document.getElementsByName("billaddress1")[0].required = false;
				document.getElementsByName("billaddress2")[0].required = false;
				document.getElementsByName("bsuburb")[0].required = false;
				document.getElementsByName("billcity")[0].required = false;
				document.getElementsByName("billprovince")[0].required = false;
				document.getElementsByName("billzipcode")[0].required = false;
            }
            if (this.value == '0') {
				document.getElementById("form-address-inner").style.display="block";
				
                document.getElementById("div_p_miri_account").style.display="none";
				document.getElementById("form-address-inner").style.display="block";
				document.getElementsByName("address1")[0].required = true;
				document.getElementsByName("address2")[0].required = false;
				document.getElementsByName("suburb")[0].required = false;
				document.getElementsByName("city")[0].required = true;
				document.getElementsByName("province")[0].required = true;
				document.getElementsByName("postcode")[0].required = true;
				document.getElementsByName("billaddress1")[0].required = true;
				document.getElementsByName("billaddress2")[0].required = false;
				document.getElementsByName("bsuburb")[0].required = false;
				document.getElementsByName("billcity")[0].required = true;
				document.getElementsByName("billprovince")[0].required = true;
				document.getElementsByName("billzipcode")[0].required = true;
                	//$("#p_miri_account").val("");
            }
        });
        
        $('input:checkbox[name=same_address]').change(function () {
            //alert(this.value);
           if (document.getElementById('same_address').checked){
                //alert('ffff');
                document.getElementsByName("billaddress1")[0].value=document.getElementsByName("address1")[0].value;
                    document.getElementsByName("billaddress2")[0].value=document.getElementsByName("address2")[0].value;
                    document.getElementsByName("bsuburb")[0].value=document.getElementsByName("suburb")[0].value;
                  document.getElementsByName("billcity")[0].value=document.getElementsByName("city")[0].value;
                    document.getElementsByName("billprovince")[0].value=document.getElementsByName("province")[0].value;
                    document.getElementsByName("billzipcode")[0].value=document.getElementsByName("postcode")[0].value;
                    $('#bill_country option[value="'+document.getElementsByName("ship_country")[0].value+'"]').attr('selected','selected');
                    
            }else {
                  document.getElementsByName("billaddress1")[0].value=''
                    document.getElementsByName("billaddress2")[0].value='';
                    document.getElementsByName("bsuburb")[0].value='';
                  document.getElementsByName("billcity")[0].value='';
                    document.getElementsByName("billprovince")[0].value='';
                    document.getElementsByName("billzipcode")[0].value='';
                    	document.getElementsByName("bill_country")[0].value=''
            }
        });
        $('input:checkbox[name=same_reg_address]').change(function () {
            //alert(this.value);
           if (document.getElementById('same_reg_address').checked){
                //alert('ffff');
                document.getElementsByName("address1")[0].value=document.getElementsByName("bus_address1")[0].value;
                    document.getElementsByName("address2")[0].value=document.getElementsByName("bus_address2")[0].value;
                    document.getElementsByName("suburb")[0].value=document.getElementsByName("bus_suburb")[0].value;
                  document.getElementsByName("city")[0].value=document.getElementsByName("bus_city")[0].value;
                    document.getElementsByName("province")[0].value=document.getElementsByName("bus_province")[0].value;
                    document.getElementsByName("postcode")[0].value=document.getElementsByName("bus_postcode")[0].value;
                     $('#ship_country option[value="'+document.getElementsByName("c_id_country")[0].value+'"]').attr('selected','selected');
                    
            }else {
                  document.getElementsByName("address1")[0].value=''
                    document.getElementsByName("address2")[0].value='';
                    document.getElementsByName("suburb")[0].value='';
                  document.getElementsByName("city")[0].value='';
                    document.getElementsByName("province")[0].value='';
                    document.getElementsByName("postcode")[0].value='';
                    	document.getElementsByName("ship_country")[0].value='';
				
            }
        });
        /*	var varCountryprefix=$("#c_id_country option:selected").attr("call_prefix");
		if(varCountryprefix!='' && typeof varCountryprefix !=="undefined"){
				//qdocument.querySelector('#c_id_country').value = value;
				//alert(varCountryprefix);
     		$(".prefix").html("+"+varCountryprefix);
			 $("input#phone").css("padding-left","10%");
     $("input#company_phone1").css("padding-left","10%");
     $("input#company_phone2").css("padding-left","10%");
	 }*/
    
});
//$(".register-form p").css("display", "none");
//document.getElementsByName("register-form p")[0].css("display", "none");


function countryUpdate(value,call_prefix,iso){
    return true;
    document.querySelector('#c_id_country').value = value;
     $(".prefix").html("+"+call_prefix);
     $("input#phone").css("padding-left","10%");
     $("input#company_phone1").css("padding-left","10%");
     $("input#company_phone2").css("padding-left","10%");
      //setFlagPosition(iso);
}
function Customacc(arg=0){
    
	//alert('gggg');
	var acount_type=document.getElementById("acount_type").value;
	if(acount_type=="4"){
	   

	 $(".prefix").html('');
	$("input.form-control").removeAttr("style");
	$("select.form-control").removeAttr("style");
			document.getElementById("Business-info").style.display="none";
			document.getElementById("job-title").style.display="none";
			document.getElementById("personal-hide").style.display="block";
			document.getElementById("business_display").style.display="none";
			document.getElementById("personal_display").style.display="block";
			document.getElementById("personal_displayh3").style.display="block";
			document.getElementById("form-details").style.display="block";
			document.getElementById("form-save-option").style.display="block";
			document.getElementsByName("phone")[0].setAttribute("placeholder", "Phone*");
			document.getElementById("id_store_inner").style.display="block";
		
			if(document.getElementsByName("address2")[0].value==''){
			        
				document.getElementsByName("address2")[0].setAttribute("placeholder", "Street 2");
			}
			
			document.getElementById("link-account").style.display="none";
			document.getElementById("div_same_reg_address").style.display="none";
			$("#personal-details-inner").appendTo("#personal-details");
				$("#c_id_country_det").appendTo("#personal-hide");
			$(".busreg").removeAttr("required");
			$(".busreg").val("");
			$('input[id=id_miro_1]').removeAttr('checked');
			$('input[id=id_miro_0]').removeAttr('disabled');
			$("input[name='id_miro'][value='0']").prop('checked', true);
			 $('input[id=id_miro_0]').attr('checked', 'checked');
			document.getElementById("div_p_miri_account").style.display="none";
		    	document.getElementById("form-address-inner").style.display="block";
		    	 document.getElementsByName("p_miri_account")[0].value='';
					document.getElementsByName("address1")[0].required = true;
				document.getElementsByName("address2")[0].required = false;
				document.getElementsByName("suburb")[0].required = false;
				document.getElementsByName("city")[0].required = true;
				document.getElementsByName("province")[0].required = true;
				document.getElementsByName("postcode")[0].required = true;
				document.getElementsByName("billaddress1")[0].required = true;
				document.getElementsByName("billaddress2")[0].required = false;
				document.getElementsByName("bsuburb")[0].required = false;
				document.getElementsByName("billcity")[0].required = true;
				document.getElementsByName("billprovince")[0].required = true;
				document.getElementsByName("billzipcode")[0].required = true;
				if(arg==0){
				document.getElementsByName("billaddress1")[0].value=''
                    document.getElementsByName("billaddress2")[0].value='';
                    document.getElementsByName("bsuburb")[0].value='';
                  document.getElementsByName("billcity")[0].value='';
                    document.getElementsByName("billprovince")[0].value='';
                    document.getElementsByName("billzipcode")[0].value='';
					document.getElementsByName("address1")[0].value=''
                    document.getElementsByName("address2")[0].value='';
                    document.getElementsByName("suburb")[0].value='';
                  document.getElementsByName("city")[0].value='';
                    document.getElementsByName("province")[0].value='';
                    document.getElementsByName("postcode")[0].value='';
					document.getElementsByName("c_id_country")[0].value=''
						document.getElementsByName("ship_country")[0].value=''
					document.getElementsByName("bill_country")[0].value=''
                    document.getElementsByName("firstname")[0].value='';
                    document.getElementsByName("lastname")[0].value='';
                  document.getElementsByName("email")[0].value='';
                    document.getElementsByName("phone")[0].value='';
                    document.getElementsByName("information")[0].value='';
					document.getElementsByName("feedback")[0].value='';
					document.getElementsByName("birthday")[0].value='';
					document.getElementsByName("company_birthday")[0].value='';
					$(".help-block").remove();
					}
					


	}else if(acount_type=="5"){
	   
	 
	 $(".prefix").html('');
	$("input.form-control").removeAttr("style");
	$("select.form-control").removeAttr("style");
			document.getElementById("Business-info").style.display="none";
			document.getElementById("job-title").style.display="block";
			document.getElementById("personal-hide").style.display="block";
			document.getElementById("business_display").style.display="none";
			document.getElementById("personal_display").style.display="block";
			document.getElementById("personal_displayh3").style.display="block";
			document.getElementById("form-details").style.display="block";
			document.getElementById("form-save-option").style.display="block";
			document.getElementsByName("phone")[0].setAttribute("placeholder", "Phone*");
		document.getElementById("id_store_inner").style.display="none";
			if(document.getElementsByName("address2")[0].value==''){
			        
				document.getElementsByName("address2")[0].setAttribute("placeholder", "Street 2");
			}
			
			document.getElementById("link-account").style.display="block";
			document.getElementById("div_same_reg_address").style.display="none";
			$("#personal-details-inner").appendTo("#personal-details");
				$("#c_id_country_det").appendTo("#personal-hide");
			$(".busreg").removeAttr("required");
			$(".busreg").val("");
			$('.miro_ratio').css('display','none');
			    $('input[id=id_miro_0]').removeAttr('checked');
			    $('input[id=id_miro_0]').attr("disabled",true);
			    $("input[name='id_miro'][value='1']").prop('checked', true);
			    $('input[name=id_miro]:first').attr('checked', 'checked');
			    document.getElementById("div_p_miri_account").style.display="block";
			   
		    	document.getElementById("form-address-inner").style.display="none";
		    	
				document.getElementsByName("address1")[0].required = false;
				document.getElementsByName("address2")[0].required = false;
				document.getElementsByName("suburb")[0].required = false;
				document.getElementsByName("city")[0].required = false;
				document.getElementsByName("province")[0].required = false;
				document.getElementsByName("postcode")[0].required = false;
				document.getElementsByName("billaddress1")[0].required = false;
				document.getElementsByName("billaddress2")[0].required = false;
				document.getElementsByName("bsuburb")[0].required = false;
				document.getElementsByName("billcity")[0].required = false;
				document.getElementsByName("billprovince")[0].required = false;
				document.getElementsByName("billzipcode")[0].required = false;
				if(arg==0){
				document.getElementsByName("billaddress1")[0].value=''
                    document.getElementsByName("billaddress2")[0].value='';
                    document.getElementsByName("bsuburb")[0].value='';
                  document.getElementsByName("billcity")[0].value='';
                    document.getElementsByName("billprovince")[0].value='';
                    document.getElementsByName("billzipcode")[0].value='';
					document.getElementsByName("address1")[0].value=''
                    document.getElementsByName("address2")[0].value='';
                    document.getElementsByName("suburb")[0].value='';
                  document.getElementsByName("city")[0].value='';
                    document.getElementsByName("province")[0].value='';
                    document.getElementsByName("postcode")[0].value='';
					document.getElementsByName("c_id_country")[0].value=''
						document.getElementsByName("ship_country")[0].value=''
					document.getElementsByName("bill_country")[0].value=''
                    document.getElementsByName("firstname")[0].value='';
                    document.getElementsByName("lastname")[0].value='';
                  document.getElementsByName("email")[0].value='';
                    document.getElementsByName("phone")[0].value='';
                    document.getElementsByName("information")[0].value='';
					document.getElementsByName("feedback")[0].value='';
					document.getElementsByName("birthday")[0].value='';
					document.getElementsByName("company_birthday")[0].value='';
					$(".help-block").remove();
					}
						document.getElementById("form-address-inner").style.display="none";
					


	}else if(acount_type=="3"){
	    
	      
	        $(".prefix").html('');
			$("input.form-control").removeAttr("style");
			$("select.form-control").removeAttr("style");
			$('input[id=id_miro_1]').removeAttr('checked');
			$('input[id=id_miro_0]').removeAttr('disabled');
			$("input[name='id_miro'][value='0']").prop('checked', true);
			 $('input[id=id_miro_0]').attr('checked', 'checked');
			 document.getElementsByName("p_miri_account")[0].value='';
			document.getElementById("form-address-inner").style.display="block";
			document.getElementById("Business-info").style.display="block";
				document.getElementById("job-title").style.display="block";
			document.getElementById("personal-hide").style.display="none";
			document.getElementById("business_display").style.display="block";
			document.getElementById("personal_display").style.display="none";
			document.getElementById("personal_displayh3").style.display="none";
			document.getElementById("form-details").style.display="block";
			document.getElementById("form-save-option").style.display="block";
			document.getElementById("div_same_reg_address").style.display="block";
			document.getElementById("div_miri_account").style.display="none";
			document.getElementById("miro_code_label").style.display="none";
			document.getElementById("label_miri_account").style.display="none";
			document.getElementById("id_store_inner").style.display="block";
			$("#personal-details-inner").appendTo("#form-address-inner");
			$("#c_id_country_det").appendTo("#nature_company_inner");
			//document.getElementsByClassName('phone')[0].setAttribute("value", "yolo");
			document.getElementsByName("phone")[0].setAttribute("placeholder", "Contact Phone Number*");
			if(document.getElementsByName("address2")[0].value==''){
			        
				document.getElementsByName("address2")[0].setAttribute("placeholder", "Street 2");
			}
			
				document.getElementById("link-account").style.display="none";
			$(".busreg").attr("required","");
			
					document.getElementsByName("address1")[0].required = true;
				document.getElementsByName("address2")[0].required = false;
				document.getElementsByName("suburb")[0].required = false;
				document.getElementsByName("city")[0].required = true;
				document.getElementsByName("province")[0].required = true;
				document.getElementsByName("postcode")[0].required = true;
				document.getElementsByName("billaddress1")[0].required = true;
				document.getElementsByName("billaddress2")[0].required = false;
				document.getElementsByName("bsuburb")[0].required = false;
				document.getElementsByName("billcity")[0].required = true;
				document.getElementsByName("billprovince")[0].required = true;
				document.getElementsByName("billzipcode")[0].required = true;
				if(arg==0){
				document.getElementsByName("billaddress1")[0].value=''
                    document.getElementsByName("billaddress2")[0].value='';
                    document.getElementsByName("bsuburb")[0].value='';
                  document.getElementsByName("billcity")[0].value='';
                    document.getElementsByName("billprovince")[0].value='';
                    document.getElementsByName("billzipcode")[0].value='';
					document.getElementsByName("address1")[0].value=''
                    document.getElementsByName("address2")[0].value='';
                    document.getElementsByName("suburb")[0].value='';
                  document.getElementsByName("city")[0].value='';
                    document.getElementsByName("province")[0].value='';
                    document.getElementsByName("postcode")[0].value='';
					document.getElementsByName("c_id_country")[0].value=''
					document.getElementsByName("ship_country")[0].value=''
					document.getElementsByName("bill_country")[0].value=''
                    document.getElementsByName("firstname")[0].value='';
                    document.getElementsByName("lastname")[0].value='';
                  document.getElementsByName("email")[0].value='';
                    document.getElementsByName("phone")[0].value='';
                    document.getElementsByName("information")[0].value='';
					document.getElementsByName("feedback")[0].value='';
					document.getElementsByName("birthday")[0].value='';
					document.getElementsByName("company_birthday")[0].value='';
					$(".help-block").remove();
					}
					


	}else{
		document.getElementById("form-details").style.display="none";


	}
}

 function calcPos(letter, size) {
        return -(letter.toLowerCase().charCodeAt(0) - 97) * size;
    }

function setFlagPosition (iso) {
    // size = flag size + spacing
    var default_size = {
        w: 20,
        h: 15
    };

size = default_size;
        
        var x = calcPos(iso[1], size.w),
            y = calcPos(iso[0], size.h);

        return 	$("#isocode").css('background-position', [x, 'px ', y, 'px'].join(''));
}

function onlineAccountActivation(){
$(window).on('load', function() {
      var urlParams = new URLSearchParams(location.search);

      var sapref=urlParams.get('ref');    // 1234
      var customer =urlParams.get('id_customer');
      var acnttype =urlParams.get('acount_type');
      var email1 =urlParams.get('email');
      //alert(acnttype);
      

 
      if(sapref=='sap'){
          document.getElementsByName("sap")[0].value=1;
          $('#acount_type option[value="'+acnttype+'"]').attr('selected','selected');
             $("#acount_type").prop("disabled", true);
               $("#acount_type").attr("readonly","readonly");       
           document.getElementsByName("email")[0].setAttribute("readOnly", "readOnly");
           if(acnttype==5){
                 $('.miro_ratio').css('display','none');
                 $('#link_miro').css('display','none');
               $('#acount_type').css('pointer-events','none!important');
              // document.getElementsByName("acount_type")[0].prop("readonly", true);
              $('input[id=id_miro_0]').removeAttr('checked');
			    $('input[id=id_miro_0]').attr("disabled",true);
			    $("input[name='id_miro'][value='1']").prop('checked', true)
           $('input[name=id_miro]:first').attr('checked', 'checked');
           $("#p_miri_account").prop("readonly", true);
           document.getElementsByName("p_miri_account").readOnly = true;
  //alert('hhh');
      document.getElementById("form-address-inner").style.display="none";
      document.getElementById("div_same_reg_address").style.display="none";
//alert('fff');
           }
          $.ajax({
      type: "POST",
      data: { "customer": customer ,'acnttype' : acnttype},
      url: prestashop.urls.base_url + "index.php?controller=Authentication&onlineactivation=1&customer="+customer,
      dataType: "json",
      success: function (data) {
       
        //console.log(data);
        
        
        if(acnttype==5){
             document.getElementsByName("email")[0].value=email1;
            if(data.birthday != null){
             document.getElementsByName("birthday")[0].value=data.birthday;
            }
            if(data.miri_account != null){
                 document.getElementsByName("p_miri_account")[0].value=data.miri_account;
            }
            
        }
        if(acnttype==4){
            
            if(data.address != false){
               // alert('ggg12');
                $.each(data.address, function(key, element){
                     //console.log(key+' : '+element['alias']);
                     if(element['alias']=='Shipping Address'){
                         
                        if(element['address1'] != null){
                                document.getElementsByName("address1")[0].value=element['address1'];
                        } 
                        if(element['address2'] != null){
                                document.getElementsByName("address2")[0].value=element['address2'];
                        }
                        if(element['postcode'] != null){
                                document.getElementsByName("postcode")[0].value=element['postcode'];
                        }
                        if(element['city'] != null){
                                document.getElementsByName("city")[0].value=element['city'];
                        }
                        if(element['suburb']  != null){
                                document.getElementsByName("suburb")[0].value=element['suburb'];
                        }
                        if(element['province'] != null){
                                document.getElementsByName("province")[0].value=element['province'] ;
                        }
                        
                     }
                     if(element['alias']=='Billing Address'){
                         
                        if(element['address1'] != null){
                                document.getElementsByName("billaddress1")[0].value=element['address1'];
                        } 
                        if(element['address2'] != null){
                                document.getElementsByName("billaddress2")[0].value=element['address2'];
                        }
                        if(element['postcode'] != null){
                                 document.getElementsByName("billzipcode")[0].value=element['postcode'];
                        }
                        if(element['city'] != null){
                                 document.getElementsByName("billcity")[0].value=element['city'];
                        }
                        if(element['suburb']  != null){
                                document.getElementsByName("bsuburb")[0].value=element['suburb'];
                        }
                        if(element['province'] != null){
                                document.getElementsByName("billprovince")[0].value=element['province'] ;
                        }
                        
                     }
                     
                      
                     
                });
            
            }
        }
         if(acnttype==3){
             
        if(data.email != null){
        document.getElementsByName("email")[0].value=data.email;
        }
        if(data.firstname != null){
        document.getElementsByName("firstname")[0].value=data.firstname;
        }
         if(data.lastname != null){
        document.getElementsByName("lastname")[0].value=data.lastname;
        }
        if(data.id_country != null){
       // document.getElementsByName("information")[0].value=data.information;
       $('#c_id_country option[value="'+data.id_country+'"]').attr('selected','selected');
        $('#id_country option[value="'+data.id_country+'"]').attr('selected','selected');
        var call_prefix=$('#c_id_country').find(':selected').attr('call_prefix');
        var iso_code=$('#c_id_country').find(':selected').attr('iso_code');
       // countryUpdate(data.id_country,call_prefix,iso_code);
        }
       
        if(data.phone != null){
        document.getElementsByName("phone")[0].value=data.phone;
        }
        if(data.po_required != null){
        document.getElementsByName("po_required")[0].value=data.po_required;
        }
        if(data.id_pricing_list != null){
        document.getElementsByName("id_pricing_list")[0].value=data.id_pricing_list;
        }
        if(data.payment_terms != null){
            console.log(data.payment_terms.toLowerCase());
                if((data.payment_terms.toLowerCase() == 'cod') || (data.payment_terms.toLowerCase() == 'terms')){
                    document.getElementsByName("payment_terms")[0].value=data.payment_terms.toUpperCase();
                }else {
                    document.getElementsByName("payment_terms")[0].value='TERMS'; 
                }
        }
        if(data.information != null){
       // document.getElementsByName("information")[0].value=data.information;
        $('#information option[value="'+data.information+'"]').attr('selected','selected');
        }
        if(data.feedback != null){
        document.getElementsByName("feedback")[0].value=data.feedback;
        }
            if(data.company_birthday != null){
             document.getElementsByName("company_birthday")[0].value=data.company_birthday;
            }
            if(data.miri_account != null && data.miri_account != ''){
                 document.getElementsByName("miri_account")[0].value=data.miri_account;
                 document.getElementsByName("miri_account")[0].setAttribute("readOnly", "readOnly");
            }
            if(data.company != null){
                 document.getElementsByName("company")[0].value=data.company;
            }
            if(data.trade_company_name != null){
                 document.getElementsByName("trade_company_name")[0].value=data.trade_company_name;
            }
            if(data.siret != null && data.siret != ''){
                 document.getElementsByName("siret")[0].value=data.siret;
                 document.getElementsByName("siret")[0].setAttribute("readOnly", "readOnly");
            }
            if(data.nature_company != null){
                 document.getElementsByName("nature_company")[0].value=data.nature_company;
            }
            if(data.vat_number != null && data.vat_number != ''){
                 document.getElementsByName("vat_number")[0].value=data.vat_number;
                 document.getElementsByName("vat_number")[0].setAttribute("readOnly", "readOnly");
            }
            if(data.company_phone1 != null){
                 document.getElementsByName("company_phone1")[0].value=data.company_phone1;
            }
             if(data.company_phone2 != null){
                 document.getElementsByName("company_phone2")[0].value=data.company_phone2;
            }
            if(data.job_title != null){
                 document.getElementsByName("job_title")[0].value=data.job_title;
            }
            if(data.address != false){
               // alert('ggg12');
                $.each(data.address, function(key, element){
                     console.log(key+' : '+element['alias']);
                     if(element['alias']=='Shipping Address'){
                         
                        if(element['address1'] != null){
                                document.getElementsByName("address1")[0].value=element['address1'];
                        } 
                        if(element['address2'] != null){
                                document.getElementsByName("address2")[0].value=element['address2'];
                        }
                        if(element['postcode'] != null){
                                document.getElementsByName("postcode")[0].value=element['postcode'];
                        }
                        if(element['city'] != null){
                                document.getElementsByName("city")[0].value=element['city'];
                        }
                        if(element['suburb']  != null){
                                document.getElementsByName("suburb")[0].value=element['suburb'];
                        }
                        if(element['province'] != null){
                                document.getElementsByName("province")[0].value=element['province'] ;
                        }
                        if(element['id_country'] != null){
                                  $('#ship_country option[value="'+element['id_country']+'"]').attr('selected','selected');
                        }
                        
                     }
                     if(element['alias']=='Billing Address'){
                         
                        if(element['address1'] != null){
                                document.getElementsByName("billaddress1")[0].value=element['address1'];
                        } 
                        if(element['address2'] != null){
                                document.getElementsByName("billaddress2")[0].value=element['address2'];
                        }
                        if(element['postcode'] != null){
                                 document.getElementsByName("billzipcode")[0].value=element['postcode'];
                        }
                        if(element['city'] != null){
                                 document.getElementsByName("billcity")[0].value=element['city'];
                        }
                        if(element['suburb']  != null){
                                document.getElementsByName("bsuburb")[0].value=element['suburb'];
                        }
                        if(element['province'] != null){
                                document.getElementsByName("billprovince")[0].value=element['province'] ;
                        }
                         if(element['id_country'] != null){
                                  $('#bill_country option[value="'+element['id_country']+'"]').attr('selected','selected');
                        }
                        
                     }
                     
                      if(element['alias']=='Business Address'){
                         
                        if(element['address1'] != null){
                                 document.getElementsByName("bus_address1")[0].value=element['address1'];
                        } 
                        if(element['address2'] != null){
                                document.getElementsByName("bus_address2")[0].value=element['address2'];
                        }
                        if(element['postcode'] != null){
                                 document.getElementsByName("bus_postcode")[0].value=element['postcode'];
                        }
                        if(element['city'] != null){
                                 document.getElementsByName("bus_city")[0].value=element['city'];
                        }
                        if(element['suburb']  != null){
                                document.getElementsByName("bus_suburb")[0].value=element['suburb'];
                        }
                        if(element['province'] != null){
                                document.getElementsByName("bus_province")[0].value=element['province'] ;
                        }
                        
                        
                        if(element['vat_number'] != null && element['vat_number'] != '' ){
                                document.getElementsByName("vat_number")[0].value=element['vat_number'];
                                document.getElementsByName("vat_number")[0].setAttribute("readOnly", "readOnly");
                        }
                        
                     }
                     
                });
            
            }
            
        }
        
       
      },
      dataType: 'json',
      error: function (data) {
        console.log(data);
      }
     });

      }
 });
}

// USAGE:





</script>