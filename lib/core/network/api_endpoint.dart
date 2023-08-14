class ApiEndpoint{

/// get product
static const String baseApiUrl="https://fakestoreapi.com";
static const String productApi="$baseApiUrl/products";
static String searchByProductId(int id)=>"$baseApiUrl/products/$id";
static String limitProductApi(String limit)=>"$baseApiUrl/products?limit=$limit";
static String sortProductApi(String sort)=>"$baseApiUrl/products?sort=$sort";


/// get product category
static const String productsCategories="$baseApiUrl/products/categories";
static  String specificCategory(String categoryName)=>"$baseApiUrl/products/category/$categoryName";

/// Add Products
static const String addProductApi="$baseApiUrl/products";
static String updateProductById(int id)=>"$baseApiUrl/products/$id";
static String deleteProductById(int id)=>"$baseApiUrl/products/$id";


/// Cart Product
static const String cartAddApi="$baseApiUrl/carts";
static String cartUpdate(int id)=>"$baseApiUrl/carts/$id";
static String deleteCart(int id)=>"$baseApiUrl/carts/$id";

/// Users
static const String allUsers="$baseApiUrl/users";

}