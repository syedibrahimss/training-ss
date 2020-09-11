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

{if $field.type == 'hidden'}
  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block}

{else}
{if $field.name == 'acount_type' and ($page.page_name eq 'authentication'  )}
   <div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>{l s='Account Type' d='Shop.Theme.Customeraccount'}</h2>
                   <div class="reginfo"> <div class="account_tooltip"><i class="fa fa-info-circle"></i>
                             <p class="account_tooltiptext"><b>Business account</b>: Business accounts offer unique pricing points and service levels, allowing resellers, service providers and system integrators to gain instant access to the MiRO suite of products and services.
<br/>
<b>Individual account</b>: Buying for personal use? Select Individual account and shop our vast range of network tech gadgets, online. Find your product, add it to your cart, check-out, and get your MiRO product delivered in no time.
<br/>
<b>Business associate</b>: The business associate account is for existing MiRO business partners who want to link additional authorised users to their business account. We will have get authorisation from the primary business contact before approval.</p>
                    </div>
                    <h3>{l s='Please Select' d='Shop.Theme.Customeraccount'}</h3></div>
                    
		 </div>
	</div>
                    
{/if}
{if $field.name == 'acount_type' and ($page.page_name eq 'identity'  )}
   <div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    {if $field.value eq '4'}
                    <h1>{l s='Individual account' d='Shop.Theme.Customeraccount'}</h1>
                    {/if}
                    {if $field.value eq '3'}
                    <h1>{l s='Business Account' d='Shop.Theme.Customeraccount'}</h1>
                    {/if}
                    {if $field.value eq '5'}
                    <h1>{l s='Business associate' d='Shop.Theme.Customeraccount'}</h1>
                    {/if}
                    
                    	{if $miri_account neq '' and ($page.page_name eq 'identity')}
                    	<div id="top_miri_account">
                    	    <h2>{l s='MiRO client code' d='Shop.Theme.Customeraccount'} - {$miri_account}</h2> 
                    	</div>
                    	{/if}
                    
		 </div>
	</div>
	
                    
{/if}


{if $field.name == 'company' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
<div id="form-details"  style="display:none;">
    {if $page.page_name neq 'identity' }
 <div class="form-group row "  style="height:1px;display: block;padding-top: 8px;">

  <hr  style="display:block!important;width:94%"/>
  </div>
  {/if}
{assign "class" "busreg"}
<div id="Business-info" >
   
   <div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                     <h2>{l s='Business Information' d='Shop.Theme.Customeraccount'}</h2>
                     <h3 style="font-size: 12px;font-weight: normal;">{l s='Fields marked with * are mandatory' d='Shop.Theme.Customeraccount'}</h3>
                    
            </div>
	</div>

{/if}
{if $field.name == 'job_title' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
{assign "class" "busreg"}
<div id="job-title" >
{/if}
{if $field.name == 'birthday' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}

<div id="personal-hide" >
{/if}
{if $field.name == 'address1' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
<div class="form-address" id="form-address">
<div class="form-address-inner" id="form-address-inner">

   <div class="form-group row shipping_row"   >
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6 shipping_title" >
            <div style="clear:both;display:block;">&nbsp;</div>
            <h2>{l s='Shipping Address*' d='Shop.Theme.Customeraccount'}</h2>
            <div class="col-md-12" style="padding-left: 0;">
        	
                              <span class="custom-checkbox" id="div_same_reg_address">
                        <label>
                          <input name="same_reg_address" type="checkbox" value="1"  id="same_reg_address" >
                          <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                          Same as registered company address
                        </label>
                      </span>
                     </div>
            
		 </div>
		 
	</div>

{/if}

{if $field.name == 'bus_address1' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}


   <div class="form-group row shipping_row"   >
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6 shipping_title" >
            <div style="clear:both;display:block;">&nbsp;</div>
            <h2>{l s='Registered company Address*' d='Shop.Theme.Customeraccount'}</h2>
            
		 </div>
		 
	</div>

{/if}

{if $field.name == 'firstname' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
<div id="personal-details" >
    
<div id="personal-details-inner" >
    
   <div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2 id="personal_display">{l s='Personal Information' d='Shop.Theme.Customeraccount'}</h2>
                    <h2 id="business_display">{l s='Primary Contact Person*' d='Shop.Theme.Customeraccount'}</h2>
                     <h3 id="personal_displayh3" style="font-size: 12px;font-weight: normal;">{l s='Fields marked with * are mandatory' d='Shop.Theme.Customeraccount'}</h3>
                    
 		 </div>
	</div>
                   
{/if}
{if $field.name == 'billaddress1' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
   <div class="form-group row billing_row" >
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6 billing_title" >
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>{l s='Billing Address*' d='Shop.Theme.Customeraccount'}</h2>
                     <div class="col-md-6" style="padding-left: 0;">
        	
                              <span class="custom-checkbox" id="div_same_address">
                        <label>
                          <input name="same_address" type="checkbox" value="1"  id="same_address" >
                          <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                          Same as shipping address
                        </label>
                      </span>
                     </div>
                     
                   
		 </div>
		
	</div>
	
                    
{/if}
{if $field.name == 'company_phone1' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
   <div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>{l s='Business Phone' d='Shop.Theme.Customeraccount'}</h2>
                    
		 </div>
	</div>
                    
{/if}
{if $field.name == 'id_miro' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
<div class="form-group row " style="height:1px;border: none;">
  <hr  style="display:block!important;width:94%"/>
  </div>
<div id="link-account"  >
   <div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>{l s='Link your profile to an existing MiRO Account' d='Shop.Theme.Customeraccount'}</h2>
                    
		 </div>
	</div>
                    
{/if}
{if $field.name == 'information' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
{if $field.name == 'information' and ( $page.page_name eq 'identity' )}
<div class="privacy_div " style="display:none;">
{/if}
  <div class="form-group row " style="height:1px;border: none;margin:0px;">
  <hr  style="display:block!important;width:97%"/>
  </div>
   <div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>{l s='Privacy & Marketing' d='Shop.Theme.Customeraccount'}</h2>
                    <h3 style="font-size: 12px;font-weight: normal;">{l s='Fields marked with * are mandatory' d='Shop.Theme.Customeraccount'}</h3>
                    
 		 </div>
	</div>
                   
{/if}
{if $field.name == 'alias' and $page.page_name eq 'address'}
<div id="address-hide-info"  style="display:none;">

{/if}
{if $field.name == 'id_state' and $page.page_name eq 'address'}
<div id="address-hide-info-state"  style="display:none;">
{/if}


{if $field.name == 'acount_type' and $page.page_name eq 'identity' and $field.value eq '4'}

<div id="identity-hide-info-account_type"  >
{/if}

{if $field.name == 'acount_type' and $page.page_name eq 'identity' and $field.value eq '3'}

<div id="identity-hide-info-account_type"  >
{/if}

{if $field.name == 'acount_type' and $page.page_name eq 'identity' }

<div id="identity-hide-info-account_typfe"   style="display:none;">
{/if}
{if $field.name == 'nature_company' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' ) and $field.name neq 'c_id_country'}
<div id="nature_company_inner"   >
{/if}
{if $field.name == 'company_birthday' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' ) }
<div id="company_birthday_inner"   >
{/if}
{if $field.name == 'birthday' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' ) and $field.name neq 'c_id_country'}
<div id="birthday_inner"  >
{/if}
{if $field.name == 'id_store' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
<div id="id_store_inner"  >
{/if}
  <div class="form-group row {if  $field.name === 'trade_company_name'} trade-section {/if} {if !empty($field.errors)}has-error{/if}" {if $field.name == 'firstname' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )} id="fistname_det" {/if} {if $field.name == 'lastname' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )} id="lastname_det" {/if} {if $field.name == 'c_id_country' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )} id="c_id_country_det" {/if}{if $field.name == 'phone' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )} id="phone" {/if}{if $field.name == 'company_phone1' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )} id="company_phone1" {/if}
  {if $field.name == 'vat_number' and $page.page_name eq 'address'} style="display:none;" {/if}>
    <label class="col-md-3 form-control-label{if $field.required} required{/if} {if ($field.name == 'birthday' or $field.name == 'company_birthday') and $page.page_name eq 'authentication'} birthday {/if}" id="label_{$field.name}">
      {if $field.type !== 'checkbox'}
        {$field.label}
      {/if}
    </label>
    {if $field.name == 'firstname' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
     <div class="col-md-3 {if ($field.type === 'radio-buttons')} form-control-valign{/if}" id="firstname" {if $page.page_name eq 'authentication' and $smarty.server.QUERY_STRING neq 'create_account=1'} style=" margin-bottom: 05px;"{/if}>
    {elseif $field.name == 'lastname' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
    
     <div class="col-md-3 {if ($field.type === 'radio-buttons')} form-control-valign{/if}" id="lastname" {if $page.page_name eq 'authentication' and $smarty.server.QUERY_STRING neq 'create_account=1'} style=" margin-bottom: 05px;padding-left:0px;"{/if}>
    {else}
     <div class="col-md-6{if ($field.type === 'radio-buttons')} form-control-valign{/if}" {if $page.page_name eq 'authentication' and $smarty.server.QUERY_STRING neq 'create_account=1'} style=" margin-bottom: 05px;"{/if} id="div_{$field.name}">
    
    {/if}
    {if ($page.page_name eq 'authentication' and  $smarty.get.create_account eq 1) or ($page.page_name eq 'identity')} 
    <div {if $field.name ==  'lastname'}class="col-md-10"{else} class="col-md-11"{/if} {if $field.name ==  'c_id_country'} id="div_c_id_country_new" {/if} {if $field.name ==  'company_birthday'} id="div_company_birthday_new" {/if} {if $field.name ==  'birthday'} id="div_birthday_new" {/if} {if $field.name ==  'id_store'} id="div_id_store_new" {/if}
                        {if $field.name ==  'firstname'} style="padding-right:0px" {/if} {if $field.name ==  'lastname'} style="padding-left:0px" {/if}>
        {/if}
      {if $field.type === 'select'}
      
      	{if $field.name === 'acount_type'}
      
     		 {block name='form_field_item_select'}
          <select class="form-control form-control-select" name="{$field.name}"  id="{$field.name}" {if $field.required}required{/if} onchange="Customacc();">
           <option value="0" disabled selected style="background-color: #b5b2b2!important;color: white;">{l s='Account Type' d='Shop.Forms.Labels'}</option>
            
             {foreach from=$customerGroups item="field1"}
        
       
          <option value="{$field1.id_group}" {if $field.value eq $field1.id_group} selected="seleted"{/if} style="background-color: #b5b2b2!important;color: white;"> {$field1.name}</option>
          
        {/foreach}
       
          </select>
        {/block}
		{elseif $field.name === 'c_id_country'}
      
     		 {block name='form_field_item_select'}
          <select class="form-control form-control-select" name="{$field.name}"  id="{$field.name}" >
            <option value="" disabled selected>Select </option>
             {foreach from=$countries item="field1"}
        
     
          <option  iso_code="{$field1.iso_code}" call_prefix="{$field1.call_prefix}" value="{$field1.id_country}" {if $field.value eq $field1.id_country} selected="seleted"{/if}> {$field1.country}</option>
        {/foreach}
          </select>
        {/block}
        {elseif $field.name === 'id_store'}
      
     		 {block name='form_field_item_select'}
          <select class="form-control form-control-select" name="{$field.name}"  id="{$field.name}" >
            <option value="" disabled selected>Select</option>
             {foreach from=$stores item="field1"}
        
     
          <option   value="{$field1.id_store}" {if $field.value eq $field1.id_store} selected="seleted"{/if}> {$field1.name}</option>
        {/foreach}
          </select>
        {/block}
		{else}
        {block name='form_field_item_select'}
          <select class="form-control form-control-select" name="{$field.name}" {if $field.required}required{/if}>
            <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$field.availableValues item="label" key="value"}
              <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
            {/foreach}
          </select>
        {/block}
		 {/if}
      {elseif $field.type === 'countrySelect'}

        {block name='form_field_item_country'}
          <select
          class="form-control form-control-select js-country"
          name="{$field.name}"
          {if $field.required}required{/if}
          >
            <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$field.availableValues item="label" key="value"}
              <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
            {/foreach}
          </select>
        {/block}

      {elseif $field.type === 'radio-buttons' and $field.name === 'id_miro'}

        {block name='form_field_item_radio'}
          {foreach from=$field.availableValues item="label" key="value"}
            <label class="radio-inline miro_ratio">
              <span class="custom-radio  ">
                <input
                  name="{$field.name}"
                  type="radio"
                  value="{$value}"
                  id="id_miro_{$value}"
                  {if $field.required}required{/if}
                  {if $value eq $field.value} checked {/if}
                >
                <span></span>
              </span>
              {$label}
            </label>
          {/foreach}
            <div id="div_p_miri_account" style="display:none;">
          <input class="form-control" name="p_miri_account" type="text" value="" placeholder="MiRO client code" id="p_miri_account" >
        
                    <span id="link_miro" 
"> Can't remember your MiRO Client Code? <a href="mailto:online@miro.co.za?subject=Please send me my MiRO Client Code.">Click here.</a></span>
            </div>
        {/block}
         {elseif $field.type === 'radio-buttons'}

        {block name='form_field_item_radio'}
          {foreach from=$field.availableValues item="label" key="value"}
            <label class="radio-inline">
              <span class="custom-radio">
                <input
                  name="{$field.name}"
                  type="radio"
                  value="{$value}"
                  {if $field.required}required{/if}
                  {if $value eq $field.value} checked {/if}
                >
                <span></span>
              </span>
              {$label}
            </label>
          {/foreach}
          
        {/block}
        {elseif $field.type === 'checkbox' and $field.name === 'newsletter'}
        
        {block name='form_field_item_checkbox'}
          <span class="custom-checkbox" id="newslette">
            <label>
              <input name="{$field.name}" type="checkbox" value="1" checked="checked" {if $field.value}checked="checked"{/if} {if $field.required}required{/if}>
              <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
              Yes I would like to receive the latest news and promotions from MiRO*
            </label>
          </span>
        {/block}
        
        {elseif $field.type === 'checkbox' and $field.name === 'psgdpr'}

        {block name='form_field_item_checkbox'}

          <span class="custom-checkbox" id="term">
            <label>
              <input name="{$field.name}" type="checkbox" value="1" {if $field.value}checked="checked"{/if} {if $page.page_name eq 'identity' }checked="checked"{/if}{if $field.required}required{/if}>
              <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
              Please acknowledge our <a href="index.php?id_cms=3&controller=cms" target="_blank">Terms & Conditions*</a>
            </label>
          </span>
        {/block}

      {elseif $field.type === 'checkbox'}

        {block name='form_field_item_checkbox'}
          <span class="custom-checkbox">
            <label>
              <input name="{$field.name}" type="checkbox" value="1" {if $field.value}checked="checked"{/if} {if $field.required}required{/if}>
              <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
              {$field.label nofilter}
            </label>
          </span>
        {/block}
        
        
      {elseif $field.type === 'date'}

        {block name='form_field_item_date'}
          <input name="{$field.name}" class="form-control" type="date" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}">
          {if isset($field.availableValues.comment)}
            <span class="form-control-comment">
              {$field.availableValues.comment}
            </span>
          {/if}
        {/block}

      {elseif $field.type === 'birthday'}

        {block name='form_field_item_birthday'}
          <div class="js-parent-focus">
            {html_select_date
            field_order=DMY
            time={$field.value}
            field_array={$field.name}
            prefix=false
            reverse_years=true
            field_separator='<br>'
            day_extra='class="form-control form-control-select"'
            month_extra='class="form-control form-control-select"'
            year_extra='class="form-control form-control-select"'
            day_empty={l s='-- day --' d='Shop.Forms.Labels'}
            month_empty={l s='-- month --' d='Shop.Forms.Labels'}
            year_empty={l s='-- year --' d='Shop.Forms.Labels'}
            start_year={'Y'|date}-100 end_year={'Y'|date}
            }
          </div>
        {/block}

      {elseif $field.type === 'password'}

        {block name='form_field_item_password'}
          <div class="input-group js-parent-focus">
            <input
              class="form-control js-child-focus js-visible-password"
              name="{$field.name}"
              title="{l s='At least 5 characters long' d='Shop.Forms.Help'}"
              type="password"
              placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}"
              value=""
              pattern=".{literal}{{/literal}5,{literal}}{/literal}"
              {if $field.required}required{/if}
            style="    border-radius: 13px!important;">
            
          </div>
        {/block}
        
        {elseif $field.type === 'text' and ($field.name === 'company' or  $field.name === 'company_phone1'  or $field.name === 'job_title' or $field.name === 'address2' or $field.name === 'trade_company_name' or $field.name === 'nature_company' or $field.name === 'company_birthday' or $field.name === 'vat_number' or $field.name === 'siret' or $field.name === 'miri_account' )}

        {block name='form_field_item_password'}
        {if  $field.name === 'company_phone1'}
               <div class="prefix"></div>
               {/if}
          <div class="input-group js-parent-focus">
              
              <input class="form-control" name="{$field.name}" type="text" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}" id="{$field.name}" {if $field.value != '' and ($field.name === 'company' or $field.name === 'siret' or $field.name === 'vat_number' or $field.name === 'miri_account')}readonly{/if}>
           
            
          </div>
          {if  $field.name === 'company'}
              <label style="margin: 0; cursor: pointer;">
                <input name="same_as_business_name" type="checkbox" value="1" checked="checked" id="sameasbusiness"  style="cursor: pointer;"/>
                Trading Name Same as Business Name
              </label>
         {/if}
        {/block}
        
        {elseif $field.type === 'text' and ($field.name === 'bus_suburb' or  $field.name === 'bus_province'  or $field.name === 'bus_address1' or $field.name === 'bus_address2' or $field.name === 'bus_postcode' or $field.name === 'bus_city'  )}

      {block name='form_field_item_password'}
          <div class="input-group js-parent-focus">
              
              <input class="form-control" name="{$field.name}" type="text" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}" id="{$field.name}"  {if $field.value != '' and ($field.name === 'bus_suburb' or  $field.name === 'bus_province'  or $field.name === 'bus_address1' or $field.name === 'bus_address2' or $field.name === 'bus_postcode' or $field.name === 'bus_city'  )}readonly{/if}>
           
            
          </div>
        {/block}
        
        {elseif $field.type === 'text' and ($field.name === 'birthday' or $field.name == 'company_birthday') }

       

        {block name='form_field_item_password'}

          <input name="{$field.name}" class="form-control {if ($field.name == 'birthday' or $field.name == 'company_birthday')} {if ($page.page_name eq 'authentication') || ($page.page_name eq 'identity')}  birthday_input customDatePicker dobinput {/if} {/if}" type="text" {if ($field.name == 'birthday' or $field.name == 'company_birthday')} value="{$field.value|date_format:'%d-%m-%Y'}" {else} value="{$field.value}" {/if} {if ($field.name == 'birthday' or $field.name == 'company_birthday')} {if ($page.page_name eq 'authentication') || ($page.page_name eq 'identity')} data-select="datepicker"  {/if} {/if} placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}">
         
        {/block}
         {elseif $field.type === 'text' and ($field.name === 'phone' or $field.name === 'company_phone2')}

       

        {block name='form_field_item_password'}
            <div class="prefix"></div>
          <input name="{$field.name}" class="form-control " type="text" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}" id="{$field.name}" style="outline:none!important;">
          {if $field.name === 'company_phone2'} <span id="company_cellular_msg"> Cellular number for SMS notifications</span>{/if}
         
        {/block}
        {elseif $field.type === 'text' and  $field.name == 'company_birthday' }

       

        {block name='form_field_item_password'}
          <input name="{$field.name}" class="form-control {if ($field.name == 'birthday' or $field.name == 'company_birthday') and $page.page_name eq 'authentication'} birthday_input customDatePicker here {/if}" type="text" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}">
         
        {/block}
        
        
         {elseif $field.type === 'text' and $field.name === 'information' }

       

        {block name='form_field_item_password'}
         <select class="form-control form-control-select" name="{$field.name}"  id="{$field.name}">
            <option value="" disabled selected>Where did you hear about us? </option>
            
        
     
          <option value="Google/Internet/Website" {if $field.value eq "Google/Internet/Website"} selected="seleted"{/if}> Google/Internet/Website</option>
          <option value="Social Media" {if $field.value eq "Social Media"} selected="seleted"{/if}> Social Media</option>
          <option value="MIRO Sales Team" {if $field.value eq "MIRO Sales Team"} selected="seleted"{/if}> MIRO Sales Team</option>
          <option value="Magazine" {if $field.value eq "Magazine"} selected="seleted"{/if}> Magazine </option>
          <option value="Referral" {if $field.value eq "Referral"} selected="seleted"{/if}> Referral</option>
          <option value="Trade Show and Securex" {if $field.value eq "Trade Show and Securex"} selected="seleted"{/if}> Trade Show and Securex</option>
       
          </select>
         
         
        {/block}

      {else}

        {block name='form_field_item_other'}
          <input
            class="form-control"
            name="{$field.name}"
            type="{$field.type}"
            value="{$field.value}"
            {if isset($field.availableValues.placeholder)}placeholder="{$field.availableValues.placeholder}"{/if}
            {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
            {if $field.required}required{/if}
          >
          {if isset($field.availableValues.comment)}
            
          {/if}
        {/block}

      {/if}
      {if ($page.page_name eq 'authentication' and  $smarty.get.create_account eq 1) or ($page.page_name eq 'identity')} 
      </div>
      <div class="col-md-1" style="padding-left:0px;">
          {if $field.name neq 'information' and  $field.name neq 'feedback' and  $field.name neq 'psgdpr' and  $field.name neq 'newsletter' and  $field.name neq 'acount_type' and  $field.name neq 'c_id_country' and  $field.name neq 'company_birthday' and  $field.name neq 'birthday' and  $field.name neq 'id_miro'}
          <div class="account_tooltip field-response" style="float:left;"><i class="fa fa-info-circle"></i>
                <p class="account_tooltiptext" {if $field.name ==  'lastname' or $field.name ==  'firstname'}style=" "{elseif ($page.page_name eq 'authentication')} style=" "{else}{/if}  > {if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}</p>
            </div>
            {/if}
      </div>
        {/if}
      {block name='form_field_errors'}
        {include file='_partials/form-errors.tpl' errors=$field.errors}
      {/block}

    </div>
{if $field.name == 'billzipcode' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div>

<div class="form-group row ">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6"  id="div_bill_country">
            <div class="col-md-11" id="div_bill_country_new">
            {block name='form_field_item_select'}
          <select class="form-control form-control-select" name="bill_country"  id="bill_country" >
            <option value="" disabled selected>Select </option>
             {foreach from=$countries item="field1"}
        
     
          <option  iso_code="{$field1.iso_code}" call_prefix="{$field1.call_prefix}" value="{$field1.id_country}" {if $field.value eq $field1.id_country} selected="seleted"{/if}> {$field1.country}</option>
        {/foreach}
          </select>
        {/block}
        </div>
        <div class="col-md-1" style="padding-left:0px;">
                </div>
            </div>
	
{/if}
{if $field.name == 'postcode' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div>

<div class="form-group row " >
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6" id="div_ship_country">
            <div class="col-md-11" id="div_ship_country_new">
            {block name='form_field_item_select'}
          <select class="form-control form-control-select" name="ship_country"  id="ship_country" >
            <option value="" disabled selected>Select </option>
             {foreach from=$countries item="field1"}
        
     
          <option  iso_code="{$field1.iso_code}" call_prefix="{$field1.call_prefix}" value="{$field1.id_country}" {if $field.value eq $field1.id_country} selected="seleted"{/if}> {$field1.country}</option>
        {/foreach}
          </select>
        {/block}
        </div>
        <div class="col-md-1" style="padding-left:0px;">
                </div>
            </div>
	
{/if}
 {if $field.name == 'psgdpr' and ($page.page_name eq 'identity' )}
</div>
{/if}   
    {if $field.name == 'psgdpr' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div>
{/if}
{if $field.name == 'company_phone2' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div>
{/if}
{if $field.name == 'miri_account' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div>

<div class="form-group row " id="miro_code_label">
        <label class="col-md-3 form-control-label">     
        </label>
            <div class="col-md-6">
            {if $field.value neq '' and  $page.page_name eq 'identity' }
                    
            {else}
            Can't remember your MiRO Client Code? <a href="mailto:online@miro.co.za?subject=Please send me my MiRO Client Code.">Click here.</a>
            {/if}
            </div>
	
{/if}
{if $field.name == 'nature_company' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' ) and $field.name neq 'c_id_country'}
</div>


	
{/if}
{if $field.name == 'company_birthday' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' ) }
</div>


	
{/if}
{if $field.name == 'birthday' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' ) and $field.name neq 'c_id_country'}
</div>


	
{/if}

{if $field.name == 'company' and $page.page_name eq 'address'}
</div>
{/if}
{if $field.name == 'id_state' and $page.page_name eq 'address'}
</div>
{/if}

{if $field.name == 'psgdpr' and $page.page_name eq 'identity'}
</div >
</div >
 {if $store_name}
     <div class="form-group row " id="div_mapped_branch_lable">
                <label class="col-md-3 form-control-label">     
                </label>
                    <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>Mapped Branch </h2>
            
		            </div>
		 
    </div>
    <div class="form-group row " id="div_mapped_branch_input">
             <label class="col-md-3 form-control-label required ">
              
          </label>
         <div class="col-md-6">
          <input class="form-control" name="store_name" type="text" value="{$store_name}" id="store_name" readonly>

            </div>
   </div>
                   
{/if}
{assign var="customer_pay_terms" value={Customer::getCustomerPaymentTerm(Context::getContext()->customer->id)|lower}}
              {if $customer_pay_terms == "cod"}
                  {assign var="customer_pay_terms" value="Cash Upfront"}
              {/if}
              {if $customer_pay_terms != ""}
              <div class="form-group row " id="div_pay_term_lable">
                <label class="col-md-3 form-control-label">     
                </label>
                    <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>Payment Terms </h2>
            
		            </div>
		 
                 </div>
                  <div class="form-group row " id="div_pay_term_input">
                    <label class="col-md-3 form-control-label"></label>
                    <div class="col-md-6">
                     
                      
                     
                       <input class="form-control" name="customer_pay_terms" type="text" value="{$customer_pay_terms|capitalize}" id="customer_pay_terms" readonly>
                    </div>
                  </div>
                  
              {/if}
<div class="form-group row " style="height:1px;border: none;">
  <hr style="display:block!important;width:94%">
  </div>
<div class="form-group row " id="div_password_form_lable">
                <label class="col-md-3 form-control-label">     
                </label>
                    <div class="col-md-6">
                    <div style="clear:both;display:block;">&nbsp;</div>
                    <h2>Account Password <span style="float:right;font-size:12px;" id="chg_password"><a href="javascript:void(0)" onclick="change_pass()">Change</a></span></h2>
                    
		            </div>
		 
        	</div>
        	
        
    <div class="form-group row " id="div_password_form">
             <label class="col-md-3 form-control-label required ">
              
          </label>
         <div class="col-md-6">
          <input class="form-control" name="password1" type="password" value="" id="password1" placeholder="########" >

            </div>
   </div>
    
   
  <div class="form-group row " id="div_retypepassword" >
    <label class="col-md-3 form-control-label required ">
              
          </label>
         <div class="col-md-6">
          <input class="form-control" name="re-password1" type="password" value="" id="re-password1" placeholder="########" >
        </div>
        <div class="col-md-3" id="password_check">
          
        </div>
  </div>
   <div class="form-group row " style="height:1px;border: none;">
  <hr style="display:block!important;width:94%">
  </div>
{/if}

{if $field.name == 'acount_type' and $page.page_name eq 'identity'}
</div >
{/if}
{if $field.name == 'company_phone2' and $page.page_name eq 'identity' }

</div >
{/if}
{if $field.name == 'job_title' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div >
{/if}
{if $field.name == 'c_id_country' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div >
{/if}
{if $field.name == 'phone' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div >
</div >
{/if}
{if $field.name == 'billzipcode' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}

</div >
{/if}
{if $field.name == 'id_miro' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div >
{/if}
{if $field.name == 'id_store' and ($page.page_name eq 'authentication' or $page.page_name eq 'identity' )}
</div>
{/if}
  </div>

{/if}
