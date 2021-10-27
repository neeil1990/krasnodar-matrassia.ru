<?php

require_once('../../api/Simpla.php');

class ExportWpAjax extends Simpla
{
    private $columns_names = array(
        'id'=>               'ID',
        'type'=>             'Type',
        'sku'=>              'SKU',
        'name'=>             'Name',
        'visible'=>          'Published',
        'featured'=>         'Is featured',
        'v_catalog'=>        'Visibility in catalog',
        'meta_description'=> 'Short description',
        'body'=>             'Description',
        'price_starts'=>     'Date sale price starts',
        'price_ends'=>       'Date sale price ends',
        'tax_status'=>       'Tax status',
        'tax_class'=>       'Tax class',
        'in_stock'=>       'In stock?',
        'stock'=>       'Stock',
        'backorders_allowed'=>       'Backorders allowed?',
        'sold_individually'=>       'Sold individually?',
        'weight'=>       'Weight (lbs)',
        'length'=>       'Length (in)',
        'width'=>       'Width (in)',
        'height'=>       'Height (in)',
        'allow_customer_reviews'=>       'Allow customer reviews?',
        'purchase_note'=>       'Purchase note',
        'purchase_note'=>       'Purchase note',
        'sale_price'=>       'Sale price',
        'price'=>       'Regular price',
        'category'=>       'Categories',
        'tags'=>       'Tags',
        'shipping_class'=>       'Shipping class',
        'images'=>       'Images',
        'download_limit'=>       'Download limit',
        'download_expiry_days'=>       'Download expiry days',
        'parent_sku'=>       'Parent',
        'grouped_products'=>       'Grouped products',
        'upsells'=>       'Upsells',
        'cross_sells'=>       'Cross-sells',
        'external_url'=>       'External URL',
        'button_text'=>       'Button text',
        'position'=>       'Position',
        'variant_main_name'=>       'Attribute 1 name',
        'variant_main_value'=>       'Attribute 1 value(s)',
        'attribute_main_visible'=>       'Attribute 1 visible',
        'attribute_main_global'=>       'Attribute 1 global',

    );

    private $column_delimiter = ';';
    private $subcategory_delimiter = '/';
    private $products_count = 10;
    private $export_files_dir = '../files/export/';
    private $filename = 'export.csv';

    public function fetch()
    {

        if(!$this->managers->access('export'))
            return false;

        // Эксель кушает только 1251
        //setlocale(LC_ALL, 'ru_RU.1251');
        //$this->db->query('SET NAMES cp1251');

        // Страница, которую экспортируем
        $page = $this->request->get('page');
        if(empty($page) || $page==1)
        {
            $page = 1;
            // Если начали сначала - удалим старый файл экспорта
            if(is_writable($this->export_files_dir.$this->filename))
                unlink($this->export_files_dir.$this->filename);
        }

        // Открываем файл экспорта на добавление
        $f = fopen($this->export_files_dir.$this->filename, 'ab');


        // Если начали сначала - добавим в первую строку названия колонок
        if($page == 1)
        {
            fputcsv($f, $this->columns_names, $this->column_delimiter);
        }


        // Все товары
        $products = array();
        foreach($this->products->get_products(array('page'=>$page, 'limit'=>$this->products_count)) as $p)
        {
            $products[$p->id] = (array)$p;
        }

        if(empty($products))
            return false;


        // Категории товаров
        foreach($products as $p_id=>&$product)
        {
            $categories = array();
            $cats = $this->categories->get_product_categories($p_id);
            foreach($cats as $category)
            {
                $path = array();
                $cat = $this->categories->get_category((int)$category->category_id);
                if(!empty($cat))
                {
                    // Вычисляем составляющие категории
                    foreach($cat->path as $p)
                        $path[] = str_replace($this->subcategory_delimiter, '\\'.$this->subcategory_delimiter, $p->name);
                    // Добавляем категорию к товару
                    $categories[] = implode(' > ', $path);
                }
            }
            $product['category'] = implode(', ', $categories);
        }


        // Изображения товаров
        $images = $this->products->get_images(array('product_id'=>array_keys($products)));
        foreach($images as $image)
        {
            $host = $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['SERVER_NAME'];
            // Добавляем изображения к товару чезер запятую
            if(empty($products[$image->product_id]['images']))
                $products[$image->product_id]['images'] = $host.'/files/originals/'.$image->filename;
            else
                $products[$image->product_id]['images'] .= ', '.$host.'/files/originals/'.$image->filename;

        }


        $variants = $this->variants->get_variants(array('product_id'=>array_keys($products)));
        foreach($variants as $variant)
        {
            if(isset($products[$variant->product_id]))
            {
                $v                    = array();
                $v['variant']         = $variant->name;
                $v['price']           = $variant->price;
                $v['compare_price']   = $variant->compare_price;
                $v['sku']             = $variant->sku;
                $v['color']             = $variant->color;
                $v['height']             = $variant->height;
                $v['width']             = $variant->width;
                $v['stock']           = $variant->stock;
                if($variant->infinity)
                    $v['stock']           = '';
                $products[$variant->product_id]['variants'][] = $v;
            }
        }


        foreach($products as &$product)
        {
            $product['type'] = (count($product['variants']) > 1) ? 'variable' : 'simple';
            $product['sku'] = $product['id'];
            $product['v_catalog'] = 'visible';
            $product['tax_status'] = 'taxable';
            $product['in_stock'] = '1';
            $product['backorders_allowed'] = '0';
            $product['sold_individually'] = '0';
            $product['allow_customer_reviews'] = '1';
            $product['variant_main_name'] = 'Вариант';
            $product['attribute_main_visible'] = '1';
            $product['attribute_main_global'] = '1';

            $variant_value = implode(', ',array_map(function ($data){
                return ($data['variant']) ?: "Стандарт";
            }, $product['variants']));
            $product['variant_main_value'] = $variant_value;

            if(count($product['variants']) == 1){
                $product['price'] = $product['variants'][0]['price'];
            }

            foreach($this->columns_names as $internal_name=>$column_name)
            {
                if(isset($product[$internal_name]))
                    $res_prod[$internal_name] = $product[$internal_name];
                else
                    $res_prod[$internal_name] = '';
            }

            //var_dump($res_prod);
            fputcsv($f, $res_prod, $this->column_delimiter);


            $variants = $product['variants'];
            unset($product['variants']);

            if(isset($variants) && count($variants) > 1)
                foreach($variants as $key => $variant)
                {
                    $result = array();
                    $result =  $product;

                    $result['id'] = $result['id'].$key;
                    $result['type'] = 'variation';
                    $result['body'] = '';
                    $result['allow_customer_reviews'] = '0';
                    $result['parent_sku'] = $product['id'];
                    $result['variant_main_value'] = $variant['variant'];


                    foreach($variant as $name=>$value)
                        $result[$name]=$value;

                    foreach($this->columns_names as $internal_name=>$column_name)
                    {
                        if(isset($result[$internal_name]))
                            $res[$internal_name] = $result[$internal_name];
                        else
                            $res[$internal_name] = '';
                    }

                    //var_dump($res);
                    fputcsv($f, $res, $this->column_delimiter);
                }
        }

        $total_products = $this->products->count_products();

        if($this->products_count*$page < $total_products)
            return array('end'=>false, 'page'=>$page, 'totalpages'=>$total_products/$this->products_count);
        else
            return array('end'=>true, 'page'=>$page, 'totalpages'=>$total_products/$this->products_count);

        fclose($f);

    }

}

$export_ajax = new ExportWpAjax();
$data = $export_ajax->fetch();
if($data)
{
    header("Content-type: application/json; charset=utf-8");
    header("Cache-Control: must-revalidate");
    header("Pragma: no-cache");
    header("Expires: -1");
    $json = json_encode($data);
    print $json;
}
