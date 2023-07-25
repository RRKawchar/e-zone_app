class ApiEndpoint{

/// get product
static const String baseApiUrl="https://fakestoreapi.com";
static const String productApi="$baseApiUrl/products";
static String searchByProductId(int id)=>"$baseApiUrl/products/$id";
static String limitProductApi(int limit)=>"$baseApiUrl/products?limit=$limit";
static String sortProductApi(String sort)=>"$baseApiUrl/products?sort=$sort";


/// get product category
static const String productsCategories="$baseApiUrl/products/categories";
static  String specificCategory(String categoryName)=>"$baseApiUrl/products/$categoryName";

/// Add Products
static const String addProductApi="$baseApiUrl/products";
static String updateProductById(int id)=>"$baseApiUrl/products/$id";
static String deleteProductById(int id)=>"$baseApiUrl/products/$id";
}