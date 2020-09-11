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
  <section class="register-form">
	
    



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
    <footer class="form-footer clearfix" id="form-save-option" style="display:flex!important;  justify-content: center;">
      <input type="hidden" name="submitCreate" value="1">
       <input type="hidden" name="update_password" id="update_password" value="0">
       <input type="hidden" name="link_account" id="link_account" value="0">
       <input type="hidden" name="b_id" id="b_id" value="{$b_id}">
       <input type="hidden" name="s_id" id="s_id" value="{$s_id}">
       <input type="hidden" name="bus_id" id="bus_id" value="{$bus_id}">
       <input type="hidden" name="ship_country_id" id="ship_country_id" value="{$ship_country}">
       <input type="hidden" name="bill_country_id" id="bill_country_id" value="{$bill_country}">
      {block "form_buttons"}
        <button class="btn btn-primary form-control-submit float-xs-right" data-link-action="save-customer" type="submit" onclick=" return update_customer()" style="width: 48%;
    border-radius: 15px;
    padding: .7rem 1.25rem;
    margin-top: 20px;float:none!important;">
          {l s='Save' d='Shop.Theme.Actions'}
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

Customacc();
if((document.getElementById("acount_type").value==5)){
			document.getElementById("form-address-inner").style.display="none";
		}else{
		    
		    $('#ship_country option[value="'+$("#ship_country_id").val()+'"]').attr('selected','selected');
		     $('#bill_country option[value="'+$("#bill_country_id").val()+'"]').attr('selected','selected');
		}
document.getElementsByName("email")[0].readOnly = true;
    var newsletter = document.getElementById("newslette").innerHTML;
    var term = document.getElementById("term").innerHTML;
    $("#p_miri_account").val(document.getElementsByName("miri_account")[0].value);
    
            
        $("#lastname").appendTo("#fistname_det");
        //document.getElementById("lastname").appendTo("#fistname_det");
        document.getElementById("lastname_det").remove();
        
        $('input:radio[name=id_miro]').change(function () {
            if (this.value == '1') {
                document.getElementById("div_p_miri_account").style.display="block";
            }
            if (this.value == '0') {
                document.getElementById("div_p_miri_account").style.display="none";
                	$("#p_miri_account").val("");
            }
        });
         document.getElementById("div_retypepassword").style.display="none";
        
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
                    	document.getElementsByName("bill_country")[0].value='';
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
        
      /* var varCountryprefix=$("#c_id_country option:selected").attr("call_prefix");
		if(varCountryprefix!='' && typeof varCountryprefix !=="undefined"){
				//qdocument.querySelector('#c_id_country').value = value;
				//alert(varCountryprefix);
     		$(".prefix").html("+"+varCountryprefix);
			 $("input#phone").css("padding-left","10%");
     $("input#company_phone1").css("padding-left","10%");
     $("input#company_phone2").css("padding-left","10%");
     $("#phone .prefix").css("top","9px");
	 }*/
		
		
    
});
function link_account_user(){

    document.getElementsByName("link_account")[0].value=1;
	

    
}

function sucess_msg(){
    
    $( ".modal-title" ).html('Thank you');
      $( ".modal-body" ).html('<span style="color:green">Your changes have been saved</span>');
      $('#accountModal').modal('show');
      return true;
}



function update_customer(){
    var update_password=document.getElementsByName("update_password")[0].value;
    if(update_password==1){
        var password=document.getElementsByName("password1")[0].value;
        var re_password=document.getElementsByName("re-password1")[0].value;
		if(password!=''){
				if(password!=re_password){
					//alert('mismatch');
					
					document.getElementById("password_check").innerHTML='<span style="color:red;">Password Mismatch</span>';
					return false;
				}else{
					document.getElementById("password_check").innerHTML='<span style="color:green;">Password Match</span>';
					//setTimeout(accountValidation(), 1000);
					setTimeout(function() {
							   return  accountValidation_r();
							}, 1500);
					 //return true;
				}
		}else{
		
			document.getElementById("password_check").innerHTML='<span style="color:red;">Please enter password/re-password field</span>';
			return false;
		}
    }
    //return false;
    return  accountValidation_r();
    //return false;
      //setFlagPosition(iso);
      //return;
}
function change_pass(){
	if(document.getElementsByName("update_password")[0].value==0){
	$( "#chg_password" ).html('<a href="javascript:void(0)" onclick="change_pass()">Cancel</a>');
    document.getElementById("div_retypepassword").style.display="block";
    $("#div_retypepassword").removeAttr("style");
    document.getElementsByName("update_password")[0].value=1;
	}else{
	document.getElementById("password_check").innerHTML="";
	$('#password1').val('');
	$('#re-password1').val('');
	$( "#chg_password" ).html('<a href="javascript:void(0)" onclick="change_pass()">Change</a>');
		document.getElementById("div_retypepassword").style.display="none";
		document.getElementsByName("update_password")[0].value=0;
	}
      //setFlagPosition(iso);
}

function countryUpdate(value,call_prefix,iso){
    return true;
    document.querySelector('#c_id_country').value = value;
     $(".prefix").html("+"+call_prefix);
     $("input#phone").css("padding-left","10%");
     $("input#company_phone1").css("padding-left","10%");
     $("input#company_phone2").css("padding-left","10%");
      //setFlagPosition(iso);
}
function Customacc(){
	//alert('gggg');
	var acount_type=document.getElementById("acount_type").value;
	if(acount_type=="4"){
			document.getElementById("Business-info").style.display="none";
			document.getElementById("job-title").style.display="none";
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
			
			document.getElementById("link-account").style.display="none";
			document.getElementById("div_same_reg_address").style.display="none";
			$("#personal-details-inner").appendTo("#personal-details");
				$("#c_id_country_det").appendTo("#personal-hide");
			$(".busreg").removeAttr("required");
			$(".busreg").val("");
					$("input.form-control").removeAttr("style");
			$("select.form-control").removeAttr("style");
			$(".help-block").remove();



	}else if(acount_type=="5"){
	   
	 

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
		    	 $("#p_miri_account").prop("readonly", true);
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
				
					$(".help-block").remove();
					
						document.getElementById("form-address-inner").style.display="none";
					


	}else if(acount_type=="3"){
			document.getElementById("Business-info").style.display="block";
				document.getElementById("job-title").style.display="block";
			document.getElementById("personal-hide").style.display="none";
			document.getElementById("business_display").style.display="block";
			document.getElementById("personal_display").style.display="none";
			document.getElementById("personal_displayh3").style.display="none";
			document.getElementById("form-details").style.display="block";
			document.getElementById("form-save-option").style.display="block";
			document.getElementById("div_miri_account").style.display="none";
			document.getElementById("miro_code_label").style.display="none";
			document.getElementById("label_miri_account").style.display="none";
			$("#personal-details-inner").appendTo("#form-address-inner");
			$("#c_id_country_det").appendTo("#nature_company_inner");
			//document.getElementsByClassName('phone')[0].setAttribute("value", "yolo");
			document.getElementsByName("phone")[0].setAttribute("placeholder", "Contact Phone Number*");
			if(document.getElementsByName("address2")[0].value==''){
			        
				document.getElementsByName("address2")[0].setAttribute("placeholder", "Street 2");
			}
			document.getElementById("id_store_inner").style.display="none";
				document.getElementById("link-account").style.display="none";
			$(".busreg").attr("required","");
			$("input.form-control").removeAttr("style");
			$("select.form-control").removeAttr("style");
			$(".help-block").remove();


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

// USAGE:





</script>