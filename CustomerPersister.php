<?php



/**



 * 2007-2019 PrestaShop and Contributors



 *



 * NOTICE OF LICENSE



 *



 * This source file is subject to the Open Software License (OSL 3.0)



 * that is bundled with this package in the file LICENSE.txt.



 * It is also available through the world-wide-web at this URL:



 * https://opensource.org/licenses/OSL-3.0



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



 * @author    PrestaShop SA <contact@prestashop.com>



 * @copyright 2007-2019 PrestaShop SA and Contributors



 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)



 * International Registered Trademark & Property of PrestaShop SA



 */



use PrestaShop\PrestaShop\Core\Crypto\Hashing as Crypto;



use Symfony\Component\Translation\TranslatorInterface;





include_once(_PS_MODULE_DIR_.'approveuser/approveuser.php');


class CustomerPersisterCore



{



    private $errors = [];



    private $context;



    private $crypto;



    private $translator;



    private $guest_allowed;







    public function __construct(



        Context $context,



        Crypto $crypto,



        TranslatorInterface $translator,



        $guest_allowed



    ) {



        $this->context = $context;



        $this->crypto = $crypto;



        $this->translator = $translator;



        $this->guest_allowed = $guest_allowed;



    }







    public function getErrors()



    {



        return $this->errors;



    }







    public function save(Customer $customer, $clearTextPassword, $newPassword = '', $passwordRequired = true)



    {



	//echo "kkk" ;



	



		$clearTextPassword ='';



//print_r($_REQUEST);die;

		/* Added for birthday format */
		$birthdate = Tools::getValue('birthday');

        if(!empty($birthdate)) {
        	if (preg_match("/([0-9]{2})\-([0-9]{2})\-([0-9]{4})/", $birthdate, $matches)) {
	            if (checkdate($matches[2], $matches[1], $matches[3])) {
	                $convertedDate = explode("-", $birthdate);
	                $formattedDate = $convertedDate[2]."-".$convertedDate[1]."-".$convertedDate[0];
	                $birthdate = $formattedDate;
	            }
	        }
        }
        /* Added for birthday format */



		



		   



		$customer->acount_type = Tools::getValue('acount_type');



		$customer->information = Tools::getValue('information');



		$customer->feedback = Tools::getValue('feedback');



		$customer->id_default_group = Tools::getValue('acount_type');



		$customer->id_country = Tools::getValue('c_id_country');



		$customer->phone = Tools::getValue('phone');



		$customer->miri_account = Tools::getValue('p_miri_account');



	

    if ($_REQUEST['acount_type']==4) {
       $customer->id_store = Tools::getValue('id_store'); 
    }

		if(Tools::getValue('acount_type')=='3'){

        $customer->id_store = Tools::getValue('id_store'); 
        $customer->website = Tools::getValue('website'); 
                
					
                    if(Tools::getValue('sap')==1){
                        
                        
                       $customer->active=1; 
                    }

                   
					$customer->trade_company_name = Tools::getValue('trade_company_name');

                    if(@$_REQUEST['same_as_business_name']==1){
                        
                    $customer->trade_company_name = Tools::getValue('company');;
                        
                    }

					$customer->nature_company = Tools::getValue('nature_company');



					$customer->company_birthday = Tools::getValue('company_birthday');



					$customer->company_phone1 = Tools::getValue('company_phone1');



					$customer->company_phone2 = Tools::getValue('company_phone2');



					$customer->company = Tools::getValue('company');



					$customer->job_title = Tools::getValue('job_title');



					$customer->siret = Tools::getValue('siret');



					$customer->miri_account = Tools::getValue('miri_account');



					}



        if ($customer->id) {



		//echo "ddd";



		if($_REQUEST['link_account']==0){



		//echo "edit";die;



            $address=$this->getAddressData();



            



            if(Tools::getValue('re-password1')!=''){



                //echo "password";



                    $passwordRequired=true; 



                     $clearTextPassword=Tools::getValue('re-password1');



                



            }else{



                



                //echo "no password";



                     $clearTextPassword='';



                      $passwordRequired=false;



            }



            	     $customer->firstname = Tools::getValue('firstname');



                    $customer->lastname =  Tools::getValue('lastname');



                    $customer->birthday = $birthdate;



                    $customer->phone = Tools::getValue('phone');
                   // $customer->birthday='';



             $this->update($customer, $clearTextPassword, $newPassword, $passwordRequired);


        // print_r($_REQUEST);
if($_REQUEST['p_miri_account']!='' && Tools::getValue('s_id')=='' && Tools::getValue('b_id')=='' && Tools::getValue('acount_type')=='5'){
    
		$id_business=$this->getBusinessID($_REQUEST['p_miri_account']);
		$arraddress=$this->getAddressDataBusiness($id_business[0]['id_customer']);
		//print_r($arraddress);die;

					if (count($arraddress) >0) {
                        
                        
                        
                        foreach($arraddress as $arraddress1){
                    
                                    if($arraddress1['alias']=='Shipping Address'){
                
                    					$address = new Address(null,$this->context->language->id); 
                                        $address->id_country = $arraddress1['id_country'];
                    					$address->suburb = @$arraddress1['suburb'];
                    					$address->province = @$arraddress1['province'];
                                        $address->address1 = @$arraddress1['address1'];
                    					 $address->address2 = @$arraddress1['address2'];
                                        $address->postcode = @$arraddress1['postcode'];
                                        $address->city = @$arraddress1['city'];
                                        $address->phone = @$arraddress1['phone'];
                                        if(Tools::getValue('vat_number')){
                                        $address->vat_number = Tools::getValue('vat_number');
                    					}else{
                    					$address->vat_number = '';
                    					}
                                        $address->firstname = $customer->firstname;
                                        $address->lastname = $customer->lastname;
                                        $address->id_customer = (int) $customer->id;
                                        $address->id_state = 0;
                                        $address->alias = 'Shipping Address';
                    					//print_r($address);
                    					$address->save();
                                    }
                                    
                                    if($arraddress1['alias']=='Billing Address'){
                
                    					$address = new Address(null,$this->context->language->id); 
                                        $address->id_country = $arraddress1['id_country'];
                    					$address->suburb = @$arraddress1['suburb'];
                    					$address->province = @$arraddress1['province'];
                                        $address->address1 = @$arraddress1['address1'];
                    					 $address->address2 = @$arraddress1['address2'];
                                        $address->postcode = @$arraddress1['postcode'];
                                        $address->city = @$arraddress1['city'];
                                        $address->phone = @$arraddress1['phone'];
                                        if(Tools::getValue('vat_number')){
                                        $address->vat_number = Tools::getValue('vat_number');
                    					}else{
                    					$address->vat_number = '';
                    					}
                                        $address->firstname = $customer->firstname;
                                        $address->lastname = $customer->lastname;
                                        $address->id_customer = (int) $customer->id;
                                        $address->id_state = 0;
                                        $address->alias = 'Billing Address';
                    					//print_r($address);
                    					$address->save();
                                    }


                             


                        }
                     



                    }
	}
	
	else{
            



             //$id= empty(@$address[0]['id_address'])?'null':@$address[0]['id_address'];
            //$id=Tools::getValue('s_id');
            $id= empty(Tools::getValue('s_id'))?'null':Tools::getValue('s_id');


             



             $address = new Address(



                        $id,



                        $this->context->language->id



                    );



                     //$address->id_address = 15;



					



                    $address->id_country = Tools::getValue('ship_country');



					$address->suburb = Tools::getValue('suburb');



					$address->province = Tools::getValue('province');



                    $address->address1 = Tools::getValue('address1');



					 $address->address2 = Tools::getValue('address2');



                    $address->postcode = Tools::getValue('postcode');



                    $address->city = Tools::getValue('city');



                    $address->phone = Tools::getValue('phone');


					if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}

            
                    



                    $address->firstname = $customer->firstname;



                    $address->lastname = $customer->lastname;



                    $address->id_customer = (int) $customer->id;



                    



                    $address->id_state = 0;



                    $address->alias = 'Shipping Address';   



                    //print_r($this->context->customer); die;



                    $address1=$this->getAddressData();



                    //$id1= empty(@$address1[1]['id_address'])?'null':@$address1[1]['id_address'];
                    //$id1=Tools::getValue('b_id');
                    $id1= empty(Tools::getValue('b_id'))?'null':Tools::getValue('b_id');
                     


                    if($address->save()){



			


						$address = new Address(



							$id1,



							$this->context->language->id



						);                    



	                    //$address->id_address = 16;



						 $address->id_country = Tools::getValue('bill_country');



						$address->suburb = Tools::getValue('bsuburb');



						$address->province = Tools::getValue('billprovince');



						$address->address1 = Tools::getValue('billaddress1');



						$address->address2 = Tools::getValue('billaddress2');



						$address->postcode = Tools::getValue('billzipcode');



						$address->city = Tools::getValue('billcity');					



						$address->phone = Tools::getValue('phone');



						if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}


						



						$address->firstname = $customer->firstname;



						$address->lastname = $customer->lastname;



						$address->id_customer = (int) $customer->id;



						



						$address->id_state = 0;



						$address->alias =  'Billing Address';   



					   if($address->save()){ 



					       //echo "save second addd"; die;



                        //$should_redirect = true; 



						/*Tools::redirect('index.php?controller=my-account');



						return;*/



						} 



                    }

	}	
					if(Tools::getValue('acount_type')=='3'){
							$arrUser=$this->getMiroAccountUser(	$customer->miri_account,$customer->id);


							if(count($arrUser) >0){


							foreach($arrUser as $arrUser1){



					//print_r($arrUser1);



					//echo $arrUser1['id_customer'];



					



													//$address=$this->getAddressData();



					    $address=$this->getAddressDataBusiness($arrUser1['id_customer']);



						



						    $id= empty(@$address[0]['id_address'])?'null':@$address[0]['id_address'];
						    $id1= empty(@$address[0]['id_address'])?'null':@$address[1]['id_address'];

                             $address = new Address($id,$this->context->language->id);
											 //$address->id_address = 15;
                            $address_sh = $this->getAddressData();



                                            $address->id_business_address = $address_sh[0]['id_address'];
											$address->id_country = Tools::getValue('ship_country');
											$address->suburb = Tools::getValue('suburb');
											$address->province = Tools::getValue('province');
											$address->address1 = Tools::getValue('address1');
											 $address->address2 = Tools::getValue('address2');
											$address->postcode = Tools::getValue('postcode');
											$address->city = Tools::getValue('city');
											$address->phone = Tools::getValue('phone');
											if(Tools::getValue('vat_number')){
                                            $address->vat_number = Tools::getValue('vat_number');
                        					}else{
                        					$address->vat_number = '';
                        					}
											$address->firstname = $customer->company;
											$address->lastname = $customer->company;
											$address->id_customer = (int) $arrUser1['id_customer'];
											$address->id_state = 0;
											$address->alias = 'Shipping Address';  
											//print_r($this->context->customer); die;
											$address1=$this->getAddressDataBusiness($arrUser1['id_customer']);
											$id1= empty(@$address1[1]['id_address'])?'null':@$address1[1]['id_address'];
											if($address->save()){
												$address = new Address($id1,$this->context->language->id);
												//$address->id_address = 16;
												$address_bu = $this->getAddressData();

                                                $address->id_business_address = $address_bu[1]['id_address'];
												$address->id_country = Tools::getValue('bill_country');
												$address->suburb = Tools::getValue('bsuburb');
												$address->province = Tools::getValue('billprovince');
												$address->address1 = Tools::getValue('billaddress1');
												$address->address2 = Tools::getValue('billaddress2');
												$address->postcode = Tools::getValue('billzipcode');
												$address->city = Tools::getValue('billcity');
												$address->phone = Tools::getValue('phone');
												if(Tools::getValue('vat_number')){
                                                $address->vat_number = Tools::getValue('vat_number');
                            					}else{
                            					$address->vat_number = '';
                            					}
												$address->firstname = $customer->company;
												$address->lastname = $customer->company;
												$address->id_customer = (int) $arrUser1['id_customer'];
												$address->id_state = 0;
												$address->alias =  'Billing Address'; 
											   if($address->save()){ 



												   //echo "save second addd"; die;



												//$should_redirect = true; 



												/*Tools::redirect('index.php?controller=my-account');



												return;*/



												} 



											}



											



											//echo "one recorded updated";die;



					}
					
							}
					
					
					}



                    Tools::redirect('index.php?controller=my-account&update_account=success');



                    //Tools::redirect('my-account?update_account=success');



			}else{



			//echo "ssss";


					if(Tools::getValue('acount_type')=='3'){
							$arrUser=$this->getMiroAccountUser(	$customer->miri_account,$customer->id);
		
							if(count($arrUser) >0){
		
								foreach($arrUser as $arrUser1){
		
		
		
							//print_r($arrUser1);
		
		
		
							//echo $arrUser1['id_customer'];
		
		
		
							
		
		
		
															//$address=$this->getAddressData();
		
		
		
															$address=$this->getAddressDataBusiness($arrUser1['id_customer']);
		
		
		
								
		
		
		
								$id= empty(@$address[0]['id_address'])?'null':@$address[0]['id_address'];
		
		
		
											 
		
		
		
											 $address = new Address(
		
		
		
														$id,
		
		
		
														$this->context->language->id
		
		
		
													);
		
		
		
													 //$address->id_address = 15;
		
		
		
													$address_bu = $this->getAddressData();
		
		
		
													$address->id_business_address = $address_bu[0]['id_address'];
		
		
		
													$address->id_country = Tools::getValue('ship_country');
		
		
		
													$address->suburb = Tools::getValue('suburb');
		
		
		
													$address->province = Tools::getValue('province');
		
		
		
													$address->address1 = Tools::getValue('address1');
		
		
		
													 $address->address2 = Tools::getValue('address2');
		
		
		
													$address->postcode = Tools::getValue('postcode');
		
		
		
													$address->city = Tools::getValue('city');
		
		
		
													$address->phone = Tools::getValue('phone');
		
		
		
													if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}
		
		
		
													
		
		
		
													$address->firstname = $customer->company;
		
		
		
													$address->lastname = $customer->company;
		
		
		
													$address->id_customer = (int) $arrUser1['id_customer'];
		
		
		
													
		
		
		
													$address->id_state = 0;
		
		
		
													$address->alias = 'Shipping Address';   
		
		
		
													//print_r($this->context->customer); die;
		
		
		
													$address1=$this->getAddressDataBusiness($arrUser1['id_customer']);
		
		
		
													$id1= empty(@$address1[1]['id_address'])?'null':@$address1[1]['id_address'];
		
		
		
													if($address->save()){
		
		
		
													
		
		
		
														$address = new Address(
		
		
		
															$id1,
		
		
		
															$this->context->language->id
		
		
		
														);                    
		
		
		
														//$address->id_address = 16;
		
														$address_sh = $this->getAddressData();
		
		
		
														$address->id_business_address = $address_sh[1]['id_address'];
		
		
		
														$address->id_country = Tools::getValue('bill_country');
		
		
		
														$address->suburb = Tools::getValue('bsuburb');
		
		
		
														$address->province = Tools::getValue('billprovince');
		
		
		
														$address->address1 = Tools::getValue('billaddress1');
		
		
		
														$address->address2 = Tools::getValue('billaddress2');
		
		
		
														$address->postcode = Tools::getValue('billzipcode');
		
		
		
														$address->city = Tools::getValue('billcity');					
		
		
		
														$address->phone = Tools::getValue('phone');
		
		
		
														if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}
		
		
		
														
		
		
		
														$address->firstname = $customer->company;
		
		
		
														$address->lastname = $customer->company;
		
		
		
														$address->id_customer = (int) $arrUser1['id_customer'];
		
		
		
														
		
		
		
														$address->id_state = 0;
		
		
		
														$address->alias =  'Billing Address';   
		
		
		
													   if($address->save()){ 
		
		
		
														   //echo "save second addd"; die;
		
		
		
														//$should_redirect = true; 
		
		
		
														/*Tools::redirect('index.php?controller=my-account');
		
		
		
														return;*/
		
		
		
														} 
		
		
		
													}
		
		
		
													
		
		
		
													//echo "one recorded updated";die;
		
		
		
							}
							}
							
					
					}



					//print_r($arrUser); die;



			Tools::redirect('index.php?controller=my-account&update_account=success');		



			}



			//echo "yes completed"; die;



        } else {
            
            if(Tools::getValue('acount_type')=='5'){
                $customer->job_title = Tools::getValue('job_title');
            }
            
            $customer->payment_terms = Tools::getValue('payment_terms'); 
if(Tools::getValue('acount_type')=='3'){
        $customer->id_store = Tools::getValue('id_store'); 
        
            if(Tools::getValue('sap')==1){
                        
                $customer->po_required = Tools::getValue('po_required'); 
                 $customer->id_pricing_list = Tools::getValue('id_pricing_list'); 
                       
            }

}

            $clearTextPassword ='123456';



			//print_r($_REQUEST);



			if($_REQUEST['id_miro']==1 and $_REQUEST['p_miri_account']!=''){



			 



/*			 $_REQUEST['p_miri_account']='56788765';



			 $customer->id=46;



			 $customer->firstname='ramesh';



			  $customer->lastname='sangili';*/



			



			 



			 	



				//echo "jjjj";



					$id_business=$this->getBusinessID($_REQUEST['p_miri_account']);



					//print_r($id_business);



					//echo count($id_business);



					if (count($id_business) >0) {



					//echo "ok";



					$customer->id_default_group = Tools::getValue('acount_type');



					}else{



					//echo "stop123"; die;



							$this->errors['id_miro'][] = $this->translator->trans(



							'This MiRO Account Number is not registered',



							[],



							'Shop.Notifications.Error'



								);







              			  return false;



					 



					}



					//echo "yes miro"; die;



					



				}



				//echo "yes miafafaaro"; die;

			if (Tools::getValue('acount_type')!='3') {
				$customer->birthday = $birthdate;
			}

             $this->create($customer, $clearTextPassword);



			// print_r($_REQUEST); die;



			 if($_REQUEST['id_miro']==0 || $_REQUEST['id_miro']==''){



				 $address = new Address(



							null,



							$this->context->language->id



						);                    



					



                    $address->id_country = Tools::getValue('ship_country');



					$address->suburb = Tools::getValue('suburb');



					$address->province = Tools::getValue('province');



                    $address->address1 = Tools::getValue('address1');



					 $address->address2 = Tools::getValue('address2');



                    $address->postcode = Tools::getValue('postcode');



                    $address->city = Tools::getValue('city');



                    $address->phone = Tools::getValue('phone');



                    if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



                    



                    $address->firstname = $customer->firstname;



                    $address->lastname = $customer->lastname;



                    $address->id_customer = (int) $customer->id;



                    



                    $address->id_state = 0;



                    $address->alias = 'Shipping Address';                    



                    



                    if($address->save()){



					



						$address = new Address(



							null,



							$this->context->language->id



						);                    



	



						 $address->id_country = Tools::getValue('bill_country');



						$address->suburb = Tools::getValue('bsuburb');



						$address->province = Tools::getValue('billprovince');



						$address->address1 = Tools::getValue('billaddress1');



						$address->address2 = Tools::getValue('billaddress2');



						$address->postcode = Tools::getValue('billzipcode');



						$address->city = Tools::getValue('billcity');					



						$address->phone = Tools::getValue('phone');



						if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



						



						$address->firstname = $customer->firstname;



						$address->lastname = $customer->lastname;



						$address->id_customer = (int) $customer->id;



						



						$address->id_state = 0;



						$address->alias =  'Billing Address';   



					   if($address->save()){ 



                        $should_redirect = true; 



						/*Tools::redirect('index.php?controller=my-account');



						return;*/
								if(Tools::getValue('acount_type')=='3'){
													$address = new Address(
						
						
						
													null,
						
						
						
													$this->context->language->id
						
						
						
												);                    
						
						
						
							
						
						
						
												 $address->id_country = Tools::getValue('c_id_country');
						
						
						
												$address->suburb = Tools::getValue('bus_suburb');
						
						
						
												$address->province = Tools::getValue('bus_province');
						
						
						
												$address->address1 = Tools::getValue('bus_address1');
						
						
						
												$address->address2 = Tools::getValue('bus_address2');
						
						
						
												$address->postcode = Tools::getValue('bus_postcode');
						
						
						
												$address->city = Tools::getValue('bus_city');					
						
						
						
												$address->phone = Tools::getValue('phone');
						
						
						
												if(Tools::getValue('vat_number')){
											$address->vat_number = Tools::getValue('vat_number');
											}else{
											$address->vat_number = '';
											}
						
						
						
												
						
						
						
												$address->firstname = $customer->firstname;
						
						
						
												$address->lastname = $customer->lastname;
						
						
						
												$address->id_customer = (int) $customer->id;
						
						
						
												
						
						
						
												$address->id_state = 0;
						
						
						
												$address->alias =  'Business Address';   
						
						
						
											   if($address->save()){ 
						
						
						
												$should_redirect = true; 
						
						
						
												/*Tools::redirect('index.php?controller=my-account');
						
						
						
												return;*/
						
						
						
												} 
											}



						} 



						$customer=array();$_REQUEST=array();$address=array();



						//$this->success=$this->translator->trans('Successful Created', array(), '');



						$this->success[''][] = $this->translator->trans('Successful Created', [], 'Shop.Notifications.Success');



						

                    if(Tools::getValue('acount_type')==3){
                        
                       Tools::redirect('index.php?create_account=success&act_type=3'); 
                    }else  if(Tools::getValue('acount_type')==4){
                        
                         Tools::redirect('index.php?create_account=success&act_type=4'); 
                    }else  if(Tools::getValue('acount_type')==5){
                        
                         Tools::redirect('index.php?create_account=success&act_type=5'); 
                    }else
                    {
                        Tools::redirect('index.php?create_account=success'); 
                    }
                    

					//Tools::redirect('index.php?create_account=success&act_type='.Tools::getValue('acount_type').'');



					return;                    



                    } else {



                        $customer->delete();



                        $this->errors[] = $this->trans('Could not update your information, please check your data.', array(), 'Shop.Notifications.Error');



                        $this->redirectWithNotifications($this->getCurrentURL());



                    }



			 }else if($_REQUEST['id_miro']==1){



			 



/*			 $_REQUEST['p_miri_account']='56788765';



			 $customer->id=46;



			 $customer->firstname='ramesh';



			  $customer->lastname='sangili';*/



			



			 



			 	if($_REQUEST['p_miri_account']!=''){



				//echo "jjjj";



					$id_business=$this->getBusinessID($_REQUEST['p_miri_account']);



					//print_r($id_business);



					$arraddress=$this->getAddressDataBusiness($id_business[0]['id_customer']);


                //echo count($arraddress);
				//print_r($arraddress); die;



					//echo "ok";



					//die;
                    if (count($arraddress) >0) {
                        
                        
                        
                        foreach($arraddress as $arraddress1){
                    
                                    if($arraddress1['alias']=='Shipping Address'){
                
                    					$address = new Address(null,$this->context->language->id); 
                                        $address->id_country = $arraddress1['id_country'];
                    					$address->suburb = @$arraddress1['suburb'];
                    					$address->province = @$arraddress1['province'];
                                        $address->address1 = @$arraddress1['address1'];
                    					 $address->address2 = @$arraddress1['address2'];
                                        $address->postcode = @$arraddress1['postcode'];
                                        $address->city = @$arraddress1['city'];
                                        $address->phone = @$arraddress1['phone'];
                                        if(Tools::getValue('vat_number')){
                                        $address->vat_number = Tools::getValue('vat_number');
                    					}else{
                    					$address->vat_number = '';
                    					}
                                        $address->firstname = $customer->firstname;
                                        $address->lastname = $customer->lastname;
                                        $address->id_customer = (int) $customer->id;
                                        $address->id_state = 0;
                                        $address->alias = 'Shipping Address';
                    					//print_r($address);
                    					$address->save();
                                    }
                                    
                                    if($arraddress1['alias']=='Billing Address'){
                
                    					$address = new Address(null,$this->context->language->id); 
                                        $address->id_country = $arraddress1['id_country'];
                    					$address->suburb = @$arraddress1['suburb'];
                    					$address->province = @$arraddress1['province'];
                                        $address->address1 = @$arraddress1['address1'];
                    					 $address->address2 = @$arraddress1['address2'];
                                        $address->postcode = @$arraddress1['postcode'];
                                        $address->city = @$arraddress1['city'];
                                        $address->phone = @$arraddress1['phone'];
                                        if(Tools::getValue('vat_number')){
                                        $address->vat_number = Tools::getValue('vat_number');
                    					}else{
                    					$address->vat_number = '';
                    					}
                                        $address->firstname = $customer->firstname;
                                        $address->lastname = $customer->lastname;
                                        $address->id_customer = (int) $customer->id;
                                        $address->id_state = 0;
                                        $address->alias = 'Billing Address';
                    					//print_r($address);
                    					$address->save();
                                    }


                             


                        }
                     



                    }	



					
                if(Tools::getValue('acount_type')==3){
                        
                       Tools::redirect('index.php?create_account=success&act_type=3'); 
                    }else  if(Tools::getValue('acount_type')==4){
                        
                         Tools::redirect('index.php?create_account=success&act_type=4'); 
                    }else  if(Tools::getValue('acount_type')==5){
                        
                         Tools::redirect('index.php?create_account=success&act_type=5'); 
                    }else
                    {
                        Tools::redirect('index.php?create_account=success'); 
                    }
					//Tools::redirect('index.php?create_account=success&act_type='.Tools::getValue('acount_type').'');



					return;      


						



				



				}else if($_REQUEST['acount_type']==3){



			 //echo "gggg"; die;



			 



			 $address = new Address(



							null,



							$this->context->language->id



						);                    




					



                    $address->id_country = Tools::getValue('ship_country');



					$address->suburb = Tools::getValue('suburb');



					$address->province = Tools::getValue('province');



                    $address->address1 = Tools::getValue('address1');



					 $address->address2 = Tools::getValue('address2');



                    $address->postcode = Tools::getValue('postcode');



                    $address->city = Tools::getValue('city');



                    $address->phone = Tools::getValue('phone');



                    if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



                    



                    $address->firstname = $customer->firstname;



                    $address->lastname = $customer->lastname;



                    $address->id_customer = (int) $customer->id;



                    



                    $address->id_state = 0;



                    $address->alias = 'Shipping Address';                    



                    



                    if($address->save()){



					



						$address = new Address(



							null,



							$this->context->language->id



						);                    



	



						 $address->id_country = Tools::getValue('bill_country');



						$address->suburb = Tools::getValue('bsuburb');



						$address->province = Tools::getValue('billprovince');



						$address->address1 = Tools::getValue('billaddress1');



						$address->address2 = Tools::getValue('billaddress2');



						$address->postcode = Tools::getValue('billzipcode');



						$address->city = Tools::getValue('billcity');					



						$address->phone = Tools::getValue('phone');



						if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



						



						$address->firstname = $customer->firstname;



						$address->lastname = $customer->lastname;



						$address->id_customer = (int) $customer->id;



						



						$address->id_state = 0;



						$address->alias =  'Billing Address';   



					   if($address->save()){ 



                        $should_redirect = true; 



						/*Tools::redirect('index.php?controller=my-account');



						return;*/
						
							if(Tools::getValue('acount_type')=='3'){
													$address = new Address(
						
						
						
													null,
						
						
						
													$this->context->language->id
						
						
						
												);                    
						
						
						
							
						
						
						
												 $address->id_country = Tools::getValue('c_id_country');
						
						
						
												$address->suburb = Tools::getValue('bus_suburb');
						
						
						
												$address->province = Tools::getValue('bus_province');
						
						
						
												$address->address1 = Tools::getValue('bus_address1');
						
						
						
												$address->address2 = Tools::getValue('bus_address2');
						
						
						
												$address->postcode = Tools::getValue('bus_postcode');
						
						
						
												$address->city = Tools::getValue('bus_city');					
						
						
						
												$address->phone = Tools::getValue('phone');
						
						
						
												if(Tools::getValue('vat_number')){
											$address->vat_number = Tools::getValue('vat_number');
											}else{
											$address->vat_number = '';
											}
						
						
						
												
						
						
						
												$address->firstname = $customer->firstname;
						
						
						
												$address->lastname = $customer->lastname;
						
						
						
												$address->id_customer = (int) $customer->id;
						
						
						
												
						
						
						
												$address->id_state = 0;
						
						
						
												$address->alias =  'Business Address';   
						
						
						
											   if($address->save()){ 
						
						
						
												$should_redirect = true; 
						
						
						
												/*Tools::redirect('index.php?controller=my-account');
						
						
						
												return;*/
						
						
						
												} 
											}



						} 



						$customer=array();$_REQUEST=array();$address=array();



						//$this->success=$this->translator->trans('Successful Created', array(), '');



						$this->success[''][] = $this->translator->trans('Successful Created', [], 'Shop.Notifications.Success');



						



					//Tools::redirect('index.php?create_account=success&act_type='.Tools::getValue('acount_type').'');
					     if(Tools::getValue('acount_type')==3){
                        
                       Tools::redirect('index.php?create_account=success&act_type=3'); 
                    }else  if(Tools::getValue('acount_type')==4){
                        
                         Tools::redirect('index.php?create_account=success&act_type=4'); 
                    }else  if(Tools::getValue('acount_type')==5){
                        
                         Tools::redirect('index.php?create_account=success&act_type=5'); 
                    }else
                    {
                        Tools::redirect('index.php?create_account=success'); 
                    }



					return;                    



                    } else {



                        $customer->delete();



                        $this->errors[] = $this->trans('Could not update your information, please check your data.', array(), 'Shop.Notifications.Error');



                        $this->redirectWithNotifications($this->getCurrentURL());



                    }



			 



			 }



				/* print_r($id_business);



				



			 		print_r($arraddress);die;*/



					



			 		



			 }	else{



			 //echo "gggg"; die;



			 



			 $address = new Address(



							null,




							$this->context->language->id



						);                    



					



                    $address->id_country = Tools::getValue('ship_country');



					$address->suburb = Tools::getValue('suburb');



					$address->province = Tools::getValue('province');



                    $address->address1 = Tools::getValue('address1');



					 $address->address2 = Tools::getValue('address2');



                    $address->postcode = Tools::getValue('postcode');



                    $address->city = Tools::getValue('city');



                    $address->phone = Tools::getValue('phone');



                    if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



                    



                    $address->firstname = $customer->firstname;



                    $address->lastname = $customer->lastname;



                    $address->id_customer = (int) $customer->id;



                    



                    $address->id_state = 0;



                    $address->alias = 'Shipping Address';                    



                    



                    if($address->save()){



					



						$address = new Address(



							null,



							$this->context->language->id



						);                    



	



						 $address->id_country = Tools::getValue('bill_country');



						$address->suburb = Tools::getValue('bsuburb');



						$address->province = Tools::getValue('billprovince');



						$address->address1 = Tools::getValue('billaddress1');



						$address->address2 = Tools::getValue('billaddress2');



						$address->postcode = Tools::getValue('billzipcode');



						$address->city = Tools::getValue('billcity');					



						$address->phone = Tools::getValue('phone');



						if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



						



						$address->firstname = $customer->firstname;



						$address->lastname = $customer->lastname;



						$address->id_customer = (int) $customer->id;



						



						$address->id_state = 0;



						$address->alias =  'Billing Address';   



					   if($address->save()){ 



                        $should_redirect = true; 



						/*Tools::redirect('index.php?controller=my-account');



						return;*/
											if(Tools::getValue('acount_type')=='3'){
													$address = new Address(
						
						
						
													null,
						
						
						
													$this->context->language->id
						
						
						
												);                    
						
						
						
							
						
						
						
												 $address->id_country = Tools::getValue('c_id_country');
						
						
						
												$address->suburb = Tools::getValue('bus_suburb');
						
						
						
												$address->province = Tools::getValue('bus_province');
						
						
						
												$address->address1 = Tools::getValue('bus_address1');
						
						
						
												$address->address2 = Tools::getValue('bus_address2');
						
						
						
												$address->postcode = Tools::getValue('bus_postcode');
						
						
						
												$address->city = Tools::getValue('bus_city');					
						
						
						
												$address->phone = Tools::getValue('phone');
						
						
						
												if(Tools::getValue('vat_number')){
											$address->vat_number = Tools::getValue('vat_number');
											}else{
											$address->vat_number = '';
											}
						
						
						
												
						
						
						
												$address->firstname = $customer->firstname;
						
						
						
												$address->lastname = $customer->lastname;
						
						
						
												$address->id_customer = (int) $customer->id;
						
						
						
												
						
						
						
												$address->id_state = 0;
						
						
						
												$address->alias =  'Business Address';   
						
						
						
											   if($address->save()){ 
						
						
						
												$should_redirect = true; 
						
						
						
												/*Tools::redirect('index.php?controller=my-account');
						
						
						
												return;*/
						
						
						
												} 
											}



						} 



						$customer=array();$_REQUEST=array();$address=array();



						//$this->success=$this->translator->trans('Successful Created', array(), '');



						$this->success[''][] = $this->translator->trans('Successful Created', [], 'Shop.Notifications.Success');



						



					//Tools::redirect('index.php?create_account=success&act_type='.Tools::getValue('acount_type').'');
					     if(Tools::getValue('acount_type')==3){
                        
                       Tools::redirect('index.php?create_account=success&act_type=3'); 
                    }else  if(Tools::getValue('acount_type')==4){
                        
                         Tools::redirect('index.php?create_account=success&act_type=4'); 
                    }else  if(Tools::getValue('acount_type')==5){
                        
                         Tools::redirect('index.php?create_account=success&act_type=5'); 
                    }else
                    {
                        Tools::redirect('index.php?create_account=success'); 
                    }



					return;                    



                    } else {



                        $customer->delete();



                        $this->errors[] = $this->trans('Could not update your information, please check your data.', array(), 'Shop.Notifications.Error');



                        $this->redirectWithNotifications($this->getCurrentURL());



                    }



			 



			 }	



       



        }



		return;



    }



public function getMiroAccountUser($argmiri_account=0,$companyId=0)







    {



       



          $sql = 'SELECT 



                      a.`id_customer`



                    FROM `' . _DB_PREFIX_ . 'customer` a



                    WHERE `miri_account` = "' .$argmiri_account. '" and `id_customer` != "' .$companyId. '"



                        AND a.`deleted` = 0



                        AND a.`active` = 1 ';







         $res = Db::getInstance()->executeS($sql);



        if (count($res) >0) {



            return $res;



        } else {



            return $res;



        }



    }



public function getAddressData()



    {



       



        $sql = 'SELECT 



                      a.`id_address`,



                      a.`address1`,



                      a.`address2`,



                      a.`postcode`,



                      a.`city`,



                      a.`suburb`,



                      a.`province`,
                      
                      a.`id_country`



                    FROM `' . _DB_PREFIX_ . 'address` a



                    WHERE `id_customer` = ' . (int) $this->context->customer->id. '



                        AND a.`deleted` = 0



                        AND a.`active` = 1 ORDER BY id_address asc';







         $res = Db::getInstance()->executeS($sql);



        if (count($res) >1) {



            return $res;



        } else {



            return $res;



        }



    }



public function getAddressDataBusiness($id_business=0)



    {



       



         $sql = 'SELECT 



                      a.`id_address`,



                      a.`address1`,



                      a.`address2`,



                      a.`postcode`,



                      a.`city`,



                      a.`suburb`,



                      a.`province`,
                      a.`alias`,
                       a.`id_country`



                    FROM `' . _DB_PREFIX_ . 'address` a



                    WHERE `id_customer` = ' . (int) $id_business. '



                        AND a.`deleted` = 0



                        AND a.`active` = 1 ORDER BY id_address asc';







         $res = Db::getInstance()->executeS($sql);



        if (count($res) >0) {



            return $res;



        } else {



            return $res;



        }



    }



    public function getBusinessAddressId($customer,$address)



    {



         $sql = 'SELECT 



                      a.`id_address`



                    FROM `' . _DB_PREFIX_ . 'address` a



                    WHERE `id_customer` = ' . (int) $customer. ' AND `id_business_address` = ' . (int) $address. '



                        AND a.`deleted` = 0



                        AND a.`active` = 1';





         $res = Db::getInstance()->executeS($sql);





            return $res;



    }



    public function deleteAllAddress($id){

          $sql = 'DELETE FROM `' . _DB_PREFIX_ . 'address` WHERE `id_business_address` = ' . (int) $id.' AND alias="Shipping Address"';





          $res = Db::getInstance()->executeS($sql);

    }



	



public function getBusinessID($argmiri_account=0)



    {



       



          $sql = 'SELECT 



                      a.`id_customer`



                    FROM `' . _DB_PREFIX_ . 'customer` a



                    WHERE `miri_account` = "' .$argmiri_account. '"



                        AND a.`deleted` = 0
                        
                          AND a.`acount_type` = 3


                        AND a.`active` = 1 ';







         $res = Db::getInstance()->executeS($sql);



        if (count($res) >0) {



            return $res;



        } else {



            return $res;



        }



    }



    private function update(Customer $customer, $clearTextPassword, $newPassword, $passwordRequired = true)



    {



        



        if (!$customer->is_guest) {



            $customer->passwd = $this->crypto->hash(



                $newPassword ? $newPassword : $clearTextPassword,



                _COOKIE_KEY_



            );



        }







        if ($customer->is_guest || !$passwordRequired) {



            // TODO SECURITY: Audit requested



            if ($customer->id != $this->context->customer->id) {



                // Since we're updating a customer without



                // checking the password, we need to check that



                // the customer being updated is the one from the



                // current session.







                // The error message is not great,



                // but it should only be displayed to hackers



                // so it should not be an issue :)







                $this->errors['email'][] = $this->translator->trans(



                    'There seems to be an issue with your account, please contact support',



                    [],



                    'Shop.Notifications.Error'



                );







                return false;



            }



        }







        $guest_to_customer = false;







        if ($clearTextPassword && $customer->is_guest) {



            $guest_to_customer = true;



            $customer->is_guest = false;



            $customer->passwd = $this->crypto->hash(



                $clearTextPassword,



                _COOKIE_KEY_



            );



        }







        if ($customer->is_guest || $guest_to_customer) {



            // guest cannot update their email to that of an existing real customer



			



            if (Customer::customerExists($customer->email, false, true)) {



                $this->errors['email'][] = $this->translator->trans(



                    'An account was already registered with this email address',



                    [],



                    'Shop.Notifications.Error'



                );







                return false;



            }



        }







        if ($customer->email != $this->context->customer->email) {



            $customer->removeResetPasswordToken();



        }



        



        



         if(Tools::getValue('re-password1')==''){



             //echo "re";



              $sql = 'SELECT `passwd`



                    FROM `' . _DB_PREFIX_ . 'customer`



                    WHERE `id_customer` = ' . (int) $this->context->customer->id. '';







         $res = Db::getInstance()->executeS($sql);



            $customer->passwd = @$res[0]['passwd'];



         }else{



            // echo $clearTextPassword;



          $customer->passwd = $this->crypto->hash(



                $clearTextPassword,



                _COOKIE_KEY_



            );



             



         }







        $ok = $customer->save();







        if ($ok) {



            $this->context->updateCustomer($customer);



            $this->context->cart->update();



            Hook::exec('actionCustomerAccountUpdate', [



                'customer' => $customer,



            ]);



            if ($guest_to_customer) {



                $this->sendConfirmationMail($customer);



            }



        }







        return $ok;



    }



    



    



    private function create(Customer $customer, $clearTextPassword)



    {



	//echo "yes"; die;



        if (!$clearTextPassword) {



            if (!$this->guest_allowed) {



                $this->errors['password'][] = $this->translator->trans(



                    'Password is required',



                    [],



                    'Shop.Notifications.Error'



                );







                return false;



            }







            /**



             * Warning: this is only safe provided



             * that guests cannot log in even with the generated



             * password. That's the case at least at the time of writing.



             */



            $clearTextPassword = $this->crypto->hash(



                microtime(),



                _COOKIE_KEY_



            );







            $customer->is_guest = true;



        }







        $customer->passwd = $this->crypto->hash(



            $clearTextPassword,



            _COOKIE_KEY_



        );







        if (Customer::customerExists($customer->email, false, true)) {



		//echo "checking";



		//print_r($customer); die;



            $this->errors['email'][] = $this->translator->trans(



                'An account was already registered with this email address',



                [],



                'Shop.Notifications.Error'



            );








            return false;



        }



		



        $ok = $customer->save();







        if ($ok) {



            $this->context->updateCustomer($customer);



            $this->context->cart->update();



            $this->sendConfirmationMail($customer);



            Hook::exec('actionCustomerAccountAdd', array(



                'newCustomer' => $customer,



            ));



        }







        return $ok;



    }


public function getMiroBusAccount($argmiri_account=0)







    {



       



          $sql = 'SELECT 



                      a.`email`



                    FROM `' . _DB_PREFIX_ . 'customer` a



                    WHERE `miri_account` = "' .$argmiri_account. '" and `acount_type` = 3



                        AND a.`deleted` = 0



                        AND a.`active` = 1 ';







         $res = Db::getInstance()->executeS($sql);



        if (count($res) >0) {



            return $res;



        } else {



            return $res;



        }



    }
    
    public function getMiroBusAccountProfile($argmiri_account=0)







    {



       



          $sql = 'SELECT 



                      *



                    FROM `' . _DB_PREFIX_ . 'customer` a



                    WHERE `miri_account` = "' .$argmiri_account. '" and `acount_type` = 3



                        AND a.`deleted` = 0



                        AND a.`active` = 1 ';







         $res = Db::getInstance()->executeS($sql);



        if (count($res) >0) {



            return $res;



        } else {



            return $res;



        }



    }




    private function sendConfirmationMail(Customer $customer)



    {



        if ($customer->is_guest || !Configuration::get('PS_CUSTOMER_CREATION_EMAIL')) {



            return true;



        }
        if (Tools::getValue('sap')==1 and $_REQUEST['acount_type']==3) {
            
            
            $obj = new ApproveuserModel();
        $customerId = $customer->id;
        $userActive = false;
      
		$obj->active = $userActive;
        $obj->customer_id= $customerId;
        $obj->add();

             $id_customergroupsBox = $customer->id;
            $data = ApproveuserModel::getObjectByCustomerId($id_customergroupsBox);
            //print_r($data);
            if ($data) {
                $customergroup = new ApproveuserModel($data);
                if (!$customergroup->active) {
                    $customerData = new Customer($customergroup->customer_id);
                    $customergroup->active = 1;
                    $customergroup->update();
                    if (!$customerData->hasRecentResetPasswordToken()) {
                                $customerData->stampResetPasswordToken();
                                    $customerData->update();
                            }
                    $message = '';
                    $templateVariable = array(
                        '{firstname}' => $customerData->firstname,
                        '{lastname}' => $customerData->lastname,
                        '{message}' => Tools::nl2br($message),
                        '{url}' => $this->context->link->getPageLink('password', true, null, 'token=' . $customerData->secure_key . '&id_customer=' . (int) $customerData->id . '&reset_token=' . $customerData->reset_password_token),
                        '{contactlink}' => $this->context->link->getPageLink('contact', true, null, null),
                            '{faqlink}' => $this->context->shop->getBaseURL(true, true).'index.php?id_cms=24&controller=cms&id_lang=1',
                            '{categorylink}' => $this->context->shop->getBaseURL(true, true).'index.php?id_category=2&controller=category&id_lang=1',
                            '{miri_account}' => $customerData->miri_account,
                            '{business_name}' => Customer::getBusinessAccount($customerData->miri_account),
                    );

                    if (Configuration::get('APPROVE_SEND_APPROVAL', false, $this->context->shop->id_shop_group, $this->context->shop->id)) {
                        $Mail = new Approveuser();
                        $Mail->sendEmailCustomerApprove($templateVariable, $customerData);
                    }
                }
            }
            
         $address = new Address(



							null,



							$this->context->language->id



						);                    



					



                    $address->id_country = Tools::getValue('ship_country');



					$address->suburb = Tools::getValue('suburb');



					$address->province = Tools::getValue('province');



                    $address->address1 = Tools::getValue('address1');



					 $address->address2 = Tools::getValue('address2');



                    $address->postcode = Tools::getValue('postcode');



                    $address->city = Tools::getValue('city');



                    $address->phone = Tools::getValue('phone');



                    if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



                    



                    $address->firstname = $customer->firstname;



                    $address->lastname = $customer->lastname;



                    $address->id_customer = (int) $customer->id;



                    



                    $address->id_state = 0;



                    $address->alias = 'Shipping Address';                    



                    



                    if($address->save()){



					



						$address = new Address(



							null,



							$this->context->language->id



						);                    



	



						 $address->id_country = Tools::getValue('bill_country');



						$address->suburb = Tools::getValue('bsuburb');



						$address->province = Tools::getValue('billprovince');



						$address->address1 = Tools::getValue('billaddress1');



						$address->address2 = Tools::getValue('billaddress2');



						$address->postcode = Tools::getValue('billzipcode');



						$address->city = Tools::getValue('billcity');					



						$address->phone = Tools::getValue('phone');



						if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



						



						$address->firstname = $customer->firstname;



						$address->lastname = $customer->lastname;



						$address->id_customer = (int) $customer->id;



						



						$address->id_state = 0;



						$address->alias =  'Billing Address';   



					   if($address->save()){ 



                        $should_redirect = true; 



						/*Tools::redirect('index.php?controller=my-account');



						return;*/
								if(Tools::getValue('acount_type')=='3'){
													$address = new Address(
						
						
						
													null,
						
						
						
													$this->context->language->id
						
						
						
												);                    
						
						
						
							
						
						
						
												 $address->id_country = Tools::getValue('c_id_country');
						
						
						
												$address->suburb = Tools::getValue('bus_suburb');
						
						
						
												$address->province = Tools::getValue('bus_province');
						
						
						
												$address->address1 = Tools::getValue('bus_address1');
						
						
						
												$address->address2 = Tools::getValue('bus_address2');
						
						
						
												$address->postcode = Tools::getValue('bus_postcode');
						
						
						
												$address->city = Tools::getValue('bus_city');					
						
						
						
												$address->phone = Tools::getValue('phone');
						
						
						
												if(Tools::getValue('vat_number')){
											$address->vat_number = Tools::getValue('vat_number');
											}else{
											$address->vat_number = '';
											}
						
						
						
												
						
						
						
												$address->firstname = $customer->firstname;
						
						
						
												$address->lastname = $customer->lastname;
						
						
						
												$address->id_customer = (int) $customer->id;
						
						
						
												
						
						
						
												$address->id_state = 0;
						
						
						
												$address->alias =  'Business Address';   
						
						
						
											   if($address->save()){ 
						
						
						
												$should_redirect = true; 
						
						
						
												/*Tools::redirect('index.php?controller=my-account');
						
						
						
												return;*/
						
						
						
												} 
											}



						} 



						$customer=array();$_REQUEST=array();$address=array();



						//$this->success=$this->translator->trans('Successful Created', array(), '');



						$this->success[''][] = $this->translator->trans('Successful Created', [], 'Shop.Notifications.Success');



						



					               



                    } 

            if (isset(Context::getContext()->cookie)) {
            Context::getContext()->cookie->logout();
            }

        $this->logged = 0;
            Tools::redirect('index.php?create_account=success&sap=1');
            
            return true;



        }
        
        
        if ($_REQUEST['acount_type']==4) {
            
             $varMirocode='C'.sprintf("%08d", $customer->id);
            Db::getInstance()->execute("UPDATE "._DB_PREFIX_."customer SET id_pricing_list= '1',
             payment_terms= 'COD',po_required= 'N',miri_account='".$varMirocode."'
            WHERE  id_customer = ".$customer->id."");
            
                                
            $obj = new ApproveuserModel();
        $customerId = $customer->id;
        $userActive = false;
      
		$obj->active = $userActive;
        $obj->customer_id= $customerId;
        $obj->add();

             $id_customergroupsBox = $customer->id;
            $data = ApproveuserModel::getObjectByCustomerId($id_customergroupsBox);
            //print_r($data);
            if ($data) {
                $customergroup = new ApproveuserModel($data);
                if (!$customergroup->active) {
                    $customerData = new Customer($customergroup->customer_id);
                    $customergroup->active = 1;
                    $customergroup->update();
                    if (!$customerData->hasRecentResetPasswordToken()) {
                                $customerData->stampResetPasswordToken();
                                    $customerData->update();
                            }
                    $message = '';
                    $templateVariable = array(
                        '{firstname}' => $customerData->firstname,
                        '{lastname}' => $customerData->lastname,
                        '{message}' => Tools::nl2br($message),
                        '{url}' => $this->context->link->getPageLink('password', true, null, 'token=' . $customerData->secure_key . '&id_customer=' . (int) $customerData->id . '&reset_token=' . $customerData->reset_password_token),
                        '{contactlink}' => $this->context->link->getPageLink('contact', true, null, null),
                            '{faqlink}' => $this->context->shop->getBaseURL(true, true).'index.php?id_cms=24&controller=cms&id_lang=1',
                            '{categorylink}' => $this->context->shop->getBaseURL(true, true).'index.php?id_category=2&controller=category&id_lang=1',
                            '{miri_account}' => $customerData->miri_account,
                    );

                    if (Configuration::get('APPROVE_SEND_APPROVAL', false, $this->context->shop->id_shop_group, $this->context->shop->id)) {
                        $Mail = new Approveuser();
                        $Mail->sendEmailCustomerApprove($templateVariable, $customerData);
                    }
                }
            }
            
         $address = new Address(



							null,



							$this->context->language->id



						);                    



					



                    $address->id_country = Tools::getValue('ship_country');



					$address->suburb = Tools::getValue('suburb');



					$address->province = Tools::getValue('province');



                    $address->address1 = Tools::getValue('address1');



					 $address->address2 = Tools::getValue('address2');



                    $address->postcode = Tools::getValue('postcode');



                    $address->city = Tools::getValue('city');



                    $address->phone = Tools::getValue('phone');



                    if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



                    



                    $address->firstname = $customer->firstname;



                    $address->lastname = $customer->lastname;



                    $address->id_customer = (int) $customer->id;



                    



                    $address->id_state = 0;



                    $address->alias = 'Shipping Address';                    



                    



                    if($address->save()){



					



						$address = new Address(



							null,



							$this->context->language->id



						);                    



	



						 $address->id_country = Tools::getValue('bill_country');



						$address->suburb = Tools::getValue('bsuburb');



						$address->province = Tools::getValue('billprovince');



						$address->address1 = Tools::getValue('billaddress1');



						$address->address2 = Tools::getValue('billaddress2');



						$address->postcode = Tools::getValue('billzipcode');



						$address->city = Tools::getValue('billcity');					



						$address->phone = Tools::getValue('phone');



						if(Tools::getValue('vat_number')){
                    $address->vat_number = Tools::getValue('vat_number');
					}else{
					$address->vat_number = '';
					}



						



						$address->firstname = $customer->firstname;



						$address->lastname = $customer->lastname;



						$address->id_customer = (int) $customer->id;



						



						$address->id_state = 0;



						$address->alias =  'Billing Address';   



					   if($address->save()){
					       
					   } 



						$customer=array();$_REQUEST=array();$address=array();



						//$this->success=$this->translator->trans('Successful Created', array(), '');



						$this->success[''][] = $this->translator->trans('Successful Created', [], 'Shop.Notifications.Success');



						



					               



                    } 

            if (isset(Context::getContext()->cookie)) {
            Context::getContext()->cookie->logout();
            }

        $this->logged = 0;
            //Tools::redirect('index.php?create_account=success&act_type='.Tools::getValue('acount_type').'');
                 if(Tools::getValue('acount_type')==3){
                        
                       Tools::redirect('index.php?create_account=success&act_type=3'); 
                    }else  if(Tools::getValue('acount_type')==4){
                        
                         Tools::redirect('index.php?create_account=success&act_type=4'); 
                    }else  if(Tools::getValue('acount_type')==5){
                        
                         Tools::redirect('index.php?create_account=success&act_type=5'); 
                    }else
                    {
                        Tools::redirect('index.php?create_account=success'); 
                    }
            
            return true;



        }


 if($_REQUEST['id_miro']==1 and $_REQUEST['p_miri_account']!='' and $_REQUEST['acount_type']==5){
     
     $businessuser=$this->getMiroBusAccount($_REQUEST['p_miri_account']);
     $business_profile = $this->getMiroBusAccountProfile($_REQUEST['p_miri_account']);
     Mail::Send(



            $this->context->language->id,



            'account_dept',



            $this->translator->trans(



                'A new user has been linked to your MiRO customer code',



                array(),



                'Emails.Subject'



            ),



            array(



                '{firstname}' => $customer->firstname,



                '{lastname}' => $customer->lastname,



                '{email}' => $customer->email,
                '{miri_account}' => $_REQUEST['p_miri_account'],
                '{headertxt}' => $business_profile[0]['firstname']." ".$business_profile[0]['lastname'],



                //'{url}' => $this->context->link->getPageLink('password', true, null, 'token=' . $customer->secure_key . '&id_customer=' . (int) $customer->id . '&reset_token=' . $customer->reset_password_token),



            ),



            $businessuser[0]['email'],



            $customer->firstname . ' ' . $customer->lastname



        );
     
 }
       



        $employee = Db::getInstance()->executeS("SELECT " ._DB_PREFIX_. "employee.email



FROM " ._DB_PREFIX_. "employee



                               



                                WHERE  " ._DB_PREFIX_. "employee.id_profile = 4");



        



       /* if (!$customer->hasRecentResetPasswordToken()) {



                    $customer->stampResetPasswordToken();



                    $customer->update();



                }*/



                



               // echo $this->context->link->getPageLink('password', true, null, 'token=' . $customer->secure_key . '&id_customer=' . (int) $customer->id . '&reset_token=' . $customer->reset_password_token);



               // die;



               



        Mail::Send(



            $this->context->language->id,



            'account_dept',



            $this->translator->trans(



                'New Customer Request Accounts Department',



                array(),



                'Emails.Subject'



            ),



            array(



                '{firstname}' => $customer->firstname,



                '{lastname}' => $customer->lastname,



                '{email}' => $customer->email,
                '{headertxt}' => "Account Department",



                //'{url}' => $this->context->link->getPageLink('password', true, null, 'token=' . $customer->secure_key . '&id_customer=' . (int) $customer->id . '&reset_token=' . $customer->reset_password_token),



            ),



            $employee[0]['email'],



            $customer->firstname . ' ' . $customer->lastname



        );





//echo "fgdfgdf";die;

        return 1;

        /*return Mail::Send(



            $this->context->language->id,



            'welcome_user',



            $this->translator->trans(



                'Thank You!',



                array(),



                'Emails.Subject'



            ),



            array(



                '{firstname}' => $customer->firstname,



                '{lastname}' => $customer->lastname,



                '{email}' => $customer->email,



                //'{url}' => $this->context->link->getPageLink('password', true, null, 'token=' . $customer->secure_key . '&id_customer=' . (int) $customer->id . '&reset_token=' . $customer->reset_password_token),



            ),



            $customer->email,



            $customer->firstname . ' ' . $customer->lastname



        );*/



    }



}



