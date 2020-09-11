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
class IdentityControllerCore extends FrontController
{
    public $auth = true;
    public $php_self = 'identity';
    public $authRedirection = 'identity';
    public $ssl = true;

    public $passwordRequired = true;

    /**
     * Assign template vars related to page content.
     *
     * @see FrontController::initContent()
     */
    public function initContent()
    {
        
        
       /* $action = Tools::getValue('action');
		if($action=='activity'){
				$this->setTemplate('customer/activity');
				echo "ggg";
				exit;
		}*/
        $should_redirect = false;

        $customer_form = $this->makeCustomerForm()->setPasswordRequired($this->passwordRequired);
        $customer = new Customer();
/*
        $customer_form->getFormatter()
            ->setAskForNewPassword(true)
            ->setAskForPassword($this->passwordRequired)
            ->setPasswordRequired($this->passwordRequired)
            ->setPartnerOptinRequired($customer->isFieldRequired('optin'));
            */

        if (Tools::isSubmit('submitCreate')) {
            $customer_form->fillWith(Tools::getAllValues());
           // print_r(Tools::getAllValues());
            if ($customer_form->submit()) {
                if(Tools::getValue('action') == 'cartcustomeredit'){
                  return Tools::redirect($this->context->link->getPageLink('order'));
                }else{
                  $this->success[] = $this->trans('Information successfully updated.', array(), 'Shop.Notifications.Success');
                  
                  $should_redirect = true;
                }
            } else {
                
                 $this->context->smarty->assign(store_name,@Tools::getValue('store_name'));
		  $this->context->smarty->assign(s_id,@Tools::getValue('s_id'));
		  $this->context->smarty->assign(b_id,@Tools::getValue('b_id'));
		  $this->context->smarty->assign(bus_id,@Tools::getValue('bus_id'));
		  	$this->context->smarty->assign(miri_account,@Tools::getValue('miri_account'));
		  	$this->context->smarty->assign(ship_country,@Tools::getValue('ship_country'));
		  	$this->context->smarty->assign(bill_country,@Tools::getValue('bill_country'));
                //echo "fff"; die;
                //$this->errors[] = $this->trans('Could not update your information, please check your data.', array(), 'Shop.Notifications.Error');
                
                
                
            }
        } else {
            
            $address=$this->getAddressData();
            
            foreach($address as $address1){
                //echo "gg";
                
                if($address1['alias']=='Shipping Address'){
                      $this->context->customer->address1=@$address1['address1'];
              $this->context->customer->address2=@$address1['address2'];
                $this->context->customer->postcode=@$address1['postcode'];
                  $this->context->customer->city=@$address1['city'];
                    $this->context->customer->suburb=@$address1['suburb'];
                      $this->context->customer->province=@$address1['province'];
                      $this->context->customer->s_id=@$address1['id_address'];
                      $this->context->customer->ship_country=@$address1['id_country'];
                       if($address1['vat_number']!=''){
                              $this->context->customer->vat_number=@$address1['vat_number'];
                       }
                }
                if($address1['alias']=='Billing Address'){
                    
                   $this->context->customer->billaddress1=@$address1['address1'];
              $this->context->customer->billaddress2=@$address1['address2'];
                $this->context->customer->billzipcode=@$address1['postcode'];
                  $this->context->customer->billcity=@$address1['city'];
                    $this->context->customer->bsuburb=@$address1['suburb'];
                      $this->context->customer->billprovince=@$address1['province'];
                      $this->context->customer->b_id=@$address1['id_address']; 
                      $this->context->customer->bill_country=@$address1['id_country'];
                       if($address1['vat_number']!=''){
                              $this->context->customer->vat_number=@$address1['vat_number'];
                       }
                      
                }
                 if($address1['alias']=='Business Address'){
                    $this->context->customer->bus_address1=@$address1['address1'];
              $this->context->customer->bus_address2=@$address1['address2'];
                $this->context->customer->bus_postcode=@$address1['postcode'];
                  $this->context->customer->bus_city=@$address1['city'];
                    $this->context->customer->bus_suburb=@$address1['suburb'];
                      $this->context->customer->bus_province=@$address1['province'];
                      $this->context->customer->bus_id=@$address1['id_address'];  $this->context->customer->bus_id_country=@$address1['id_country'];
                      if($address1['vat_number']!=''){
                         $this->context->customer->vat_number=@$address1['vat_number'];
                      }
                 }
                
            }
           
           
                   // $this->context->customer->birthday='';
                      $this->context->customer->id_customer=$this->context->customer->id;
                      $this->context->customer->c_id_country=$this->context->customer->id_country;
                      $this->context->customer->p_miri_account=$this->context->customer->miri_account;
                      
             
                      $this->context->customer->store_name=@$this->getStore($this->context->customer->id_store);
                      //echo $this->context->customer->store_name;
                     // echo date('Y-m-d',strtotime($this->context->customer->birthday)); die;
                     //echo $this->context->customer->birthday; die;
                     if(($this->context->customer->birthday !='0000-00-00') && $this->context->customer->birthday != NULL ){
                     $this->context->customer->birthday=date('Y-m-d',strtotime($this->context->customer->birthday));
                     }
            $customer_form->fillFromCustomer(
                $this->context->customer
            );
           
          // print_r($this->context->customer); die;
           // $customer_form->customer->address1='test';
        }

        $this->context->smarty->assign([
            'customer_form' => $customer_form->getProxy(),
        ]);

        if ($should_redirect) {
            $this->redirectWithNotifications($this->getCurrentURL());
        }

        parent::initContent();
        $action = Tools::getValue('action');
		if($action=='activity'){
		  	$arrResult=$this->getHistoryData();
			if(count($arrResult)>0)
			{
			$arrProducts=$this->getProductsDetail($arrResult);
			$arrResult[0]['most_product']=$arrProducts;
			//print_r( $arrProducts);die;
			}
			$this->context->smarty->assign(arrresult,@$arrResult[0]);
			$this->context->smarty->assign(action,$action);
			$this->context->smarty->assign(miri_account,@$this->context->customer->miri_account);
			
			//print_r( $arrResult);die;
        	$this->setTemplate('customer/activity');
		}else{
		  $this->context->smarty->assign(store_name,@$this->context->customer->store_name);
		  $this->context->smarty->assign(s_id,@$this->context->customer->s_id);
		  $this->context->smarty->assign(b_id,@$this->context->customer->b_id);
		  $this->context->smarty->assign(bus_id,@$this->context->customer->bus_id);
		  	$this->context->smarty->assign(miri_account,@$this->context->customer->miri_account);
		  	$this->context->smarty->assign(ship_country,@$this->context->customer->ship_country);
		  	$this->context->smarty->assign(bill_country,@$this->context->customer->bill_country);
		   $this->setTemplate('customer/identity'); 
		}
    }
    
    
    	public function getStore($id_Store='')
    {
	
	//print_r($argArray); die;
	  $sql='
        SELECT name
        FROM `' . _DB_PREFIX_ . 'store_lang` 
		
        WHERE `id_lang` =1  and `id_store`='.$id_Store;
       $arrProducts= Db::getInstance()->executeS($sql);
		if(count($arrProducts)>0)
			{
                return $arrProducts[0]['name'];
            }else{
			 return '';
			}
    }
	
	public function getProductsDetail($argArray='')
    {
	
	//print_r($argArray); die;
	  $sql='
        SELECT p.*, ps.*,pl.*,imp.id_image,imp.cover,od.product_id,count(od.product_id) as order_count
        FROM `' . _DB_PREFIX_ . 'order_detail` od
        LEFT JOIN `' . _DB_PREFIX_ . 'product` p ON (p.id_product = od.product_id)
		LEFT JOIN ' . _DB_PREFIX_ . 'product_lang pl ON (pl.id_product = p.id_product )
        LEFT JOIN `' . _DB_PREFIX_ . 'product_shop` ps ON (ps.id_product = p.id_product AND ps.id_shop = od.id_shop)
		LEFT JOIN ' . _DB_PREFIX_ . 'image_shop imp ON (imp.id_product = p.id_product AND imp.cover=1 AND imp.id_shop=1)
		LEFT JOIN ' . _DB_PREFIX_ . 'image_lang iml ON (iml.id_image = imp.id_image and iml.`id_lang` = 0)
		
        WHERE od.`id_order` in('.$argArray[0]['id_orders'].') group by  od.product_id ORDER BY order_count DESC
limit 0,4';
       $arrProducts= Db::getInstance()->executeS($sql);
		if(count($arrProducts)>0)
			{
                return $arrProducts;
            }else{
			 return ;
			}
    }
	
	public function getHistoryData($id_lang='', $id_order_state = false, $no_hidden = false, $filters = 0)
    {	$id_order_state = 0;
        if (!$id_order_state) {
            $id_order_state = 0;
        }
		$this->id =$this->context->customer->id;
		//$this->id =15;
		$filters =1;
        $logable = false;
        $delivery = false;
        $paid = false;
        $shipped = false;
        if ($filters > 0) {
            
                $no_hidden = true;
           
                $delivery = true;
           
                $logable = true;
           
                $paid = true;
           
                $shipped = true;
       
        }

  	
            $id_lang = $id_lang ? (int) $id_lang : 'o.`id_lang`';
           /* $result1 = Db::getInstance()->executeS('
            SELECT  DISTINCT oh.`id_order`,sum(o.total_paid) as total_paid,sum(o.total_discounts) as total_dis,count(o.id_order) as avg_order,GROUP_CONCAT(oh.id_order) as id_orders
            FROM `' . _DB_PREFIX_ . 'orders` o
            LEFT JOIN `' . _DB_PREFIX_ . 'order_history` oh ON o.`id_order` = oh.`id_order`
            LEFT JOIN `' . _DB_PREFIX_ . 'order_state` os ON os.`id_order_state` = oh.`id_order_state`
            LEFT JOIN `' . _DB_PREFIX_ . 'order_state_lang` osl ON (os.`id_order_state` = osl.`id_order_state` AND osl.`id_lang` = ' . (int) ($id_lang) . ')
            LEFT JOIN `' . _DB_PREFIX_ . 'employee` e ON e.`id_employee` = oh.`id_employee`
            WHERE o.id_customer = ' . (int) $this->id . ' AND (os.delivery = 1 
OR os.paid = 1 OR os.shipped = 1)
            ORDER BY oh.date_add DESC, oh.id_order_history DESC');*/
           
            
             $result1 = Db::getInstance()->executeS('SELECT DISTINCT o.`id_order`,sum(o.total_paid_tax_excl) as total_paid,sum(o.total_discounts_tax_excl) as total_dis,
count(o.id_order) as tot_order,
(sum(o.total_paid_tax_excl)/count(o.id_order)) as avg_order,GROUP_CONCAT(o.id_order) as id_orders,
(SELECT oh.`id_order_state` FROM `' . _DB_PREFIX_ . 'order_history` oh LEFT JOIN `' . _DB_PREFIX_ . 'order_state` os ON (os.`id_order_state` = oh.`id_order_state`) 
WHERE oh.`id_order` = o.`id_order` AND os.`hidden` != 1 ORDER BY oh.`date_add` DESC, oh.`id_order_history` DESC LIMIT 1) 
id_order_state FROM `' . _DB_PREFIX_ . 'orders` o 
        WHERE o.`id_customer` = ' . (int) $this->id .' GROUP BY o.`id_customer`');
            
            
             
			
            if(count($result1)>0)
			{
                return $result1;
            }else{
			 return ;
			}
			
      

        return;
    }

    public function getBreadcrumbLinks()
    {
        
         $action = Tools::getValue('action');
		if($action=='activity'){
        $breadcrumb = parent::getBreadcrumbLinks();
        $breadcrumb['links'][] = array(
            'title' => $this->trans('My Account', array(), 'Shop.Theme.Customeraccount'),
            'url' => $this->context->link->getPageLink('my-account', null, null, array('action' => 'show')),
        );
        $breadcrumb['links'][] = array(
            'title' => $this->getTranslator()->trans('Activity', array(), 'Shop.Theme.Customeraccount'),
            'url' => '',
        );

        return $breadcrumb;
		}else{
		       $breadcrumb = parent::getBreadcrumbLinks();
        $breadcrumb['links'][] = array(
            'title' => $this->trans('My Account', array(), 'Shop.Theme.Customeraccount'),
            'url' => $this->context->link->getPageLink('my-account', null, null, array('action' => 'show')),
        );
        $breadcrumb['links'][] = array(
            'title' => $this->getTranslator()->trans('Account Settings', array(), 'Shop.Theme.Customeraccount'),
            'url' => '',
        );

        return $breadcrumb;  
		    
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
                       a.`vat_number`,
                       a.`alias`,
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
}