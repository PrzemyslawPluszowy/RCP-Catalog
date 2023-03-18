import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'dimensions.dart';
import 'image.dart';
import 'links.dart';
import 'meta_datum.dart';
import 'tag.dart';
import 'yoast_head_json.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  @JsonKey(name: 'date_created')
  String? dateCreated;
  @JsonKey(name: 'date_created_gmt')
  String? dateCreatedGmt;
  @JsonKey(name: 'date_modified')
  String? dateModified;
  @JsonKey(name: 'date_modified_gmt')
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  @JsonKey(name: 'catalog_visibility')
  String? catalogVisibility;
  String? description;
  @JsonKey(name: 'short_description')
  String? shortDescription;
  String? sku;
  String? price;
  @JsonKey(name: 'regular_price')
  String? regularPrice;
  @JsonKey(name: 'sale_price')
  String? salePrice;
  @JsonKey(name: 'date_on_sale_from')
  dynamic dateOnSaleFrom;
  @JsonKey(name: 'date_on_sale_from_gmt')
  dynamic dateOnSaleFromGmt;
  @JsonKey(name: 'date_on_sale_to')
  dynamic dateOnSaleTo;
  @JsonKey(name: 'date_on_sale_to_gmt')
  dynamic dateOnSaleToGmt;
  @JsonKey(name: 'on_sale')
  bool? onSale;
  bool? purchasable;
  @JsonKey(name: 'total_sales')
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  @JsonKey(name: 'download_limit')
  int? downloadLimit;
  @JsonKey(name: 'download_expiry')
  int? downloadExpiry;
  @JsonKey(name: 'external_url')
  String? externalUrl;
  @JsonKey(name: 'button_text')
  String? buttonText;
  @JsonKey(name: 'tax_status')
  String? taxStatus;
  @JsonKey(name: 'tax_class')
  String? taxClass;
  @JsonKey(name: 'manage_stock')
  bool? manageStock;
  @JsonKey(name: 'stock_quantity')
  dynamic stockQuantity;
  String? backorders;
  @JsonKey(name: 'backorders_allowed')
  bool? backordersAllowed;
  bool? backordered;
  @JsonKey(name: 'low_stock_amount')
  dynamic lowStockAmount;
  @JsonKey(name: 'sold_individually')
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  @JsonKey(name: 'shipping_required')
  bool? shippingRequired;
  @JsonKey(name: 'shipping_taxable')
  bool? shippingTaxable;
  @JsonKey(name: 'shipping_class')
  String? shippingClass;
  @JsonKey(name: 'shipping_class_id')
  int? shippingClassId;
  @JsonKey(name: 'reviews_allowed')
  bool? reviewsAllowed;
  @JsonKey(name: 'average_rating')
  String? averageRating;
  @JsonKey(name: 'rating_count')
  int? ratingCount;
  @JsonKey(name: 'upsell_ids')
  List<dynamic>? upsellIds;
  @JsonKey(name: 'cross_sell_ids')
  List<dynamic>? crossSellIds;
  @JsonKey(name: 'parent_id')
  int? parentId;
  @JsonKey(name: 'purchase_note')
  String? purchaseNote;
  List<Category> categories;
  List<Tag>? tags;
  List<ImageList>? images;
  List<dynamic>? attributes;
  @JsonKey(name: 'default_attributes')
  List<dynamic>? defaultAttributes;
  List<dynamic>? variations;
  @JsonKey(name: 'grouped_products')
  List<dynamic>? groupedProducts;
  @JsonKey(name: 'menu_order')
  int? menuOrder;
  @JsonKey(name: 'price_html')
  String? priceHtml;
  @JsonKey(name: 'related_ids')
  List<int>? relatedIds;
  @JsonKey(name: 'meta_data')
  List<MetaDatum>? metaData;
  @JsonKey(name: 'stock_status')
  String? stockStatus;
  @JsonKey(name: 'has_options')
  bool? hasOptions;
  @JsonKey(name: 'yoast_head')
  String? yoastHead;
  @JsonKey(name: 'yoast_head_json')
  YoastHeadJson? yoastHeadJson;
  @JsonKey(name: '_links')
  Links? links;

  Product({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    required this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
    this.yoastHead,
    this.yoastHeadJson,
    this.links,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, slug: $slug, permalink: $permalink, dateCreated: $dateCreated, dateCreatedGmt: $dateCreatedGmt, dateModified: $dateModified, dateModifiedGmt: $dateModifiedGmt, type: $type, status: $status, featured: $featured, catalogVisibility: $catalogVisibility, description: $description, shortDescription: $shortDescription, sku: $sku, price: $price, regularPrice: $regularPrice, salePrice: $salePrice, dateOnSaleFrom: $dateOnSaleFrom, dateOnSaleFromGmt: $dateOnSaleFromGmt, dateOnSaleTo: $dateOnSaleTo, dateOnSaleToGmt: $dateOnSaleToGmt, onSale: $onSale, purchasable: $purchasable, totalSales: $totalSales, virtual: $virtual, downloadable: $downloadable, downloads: $downloads, downloadLimit: $downloadLimit, downloadExpiry: $downloadExpiry, externalUrl: $externalUrl, buttonText: $buttonText, taxStatus: $taxStatus, taxClass: $taxClass, manageStock: $manageStock, stockQuantity: $stockQuantity, backorders: $backorders, backordersAllowed: $backordersAllowed, backordered: $backordered, lowStockAmount: $lowStockAmount, soldIndividually: $soldIndividually, weight: $weight, dimensions: $dimensions, shippingRequired: $shippingRequired, shippingTaxable: $shippingTaxable, shippingClass: $shippingClass, shippingClassId: $shippingClassId, reviewsAllowed: $reviewsAllowed, averageRating: $averageRating, ratingCount: $ratingCount, upsellIds: $upsellIds, crossSellIds: $crossSellIds, parentId: $parentId, purchaseNote: $purchaseNote, categories: $categories, tags: $tags, images: $images, attributes: $attributes, defaultAttributes: $defaultAttributes, variations: $variations, groupedProducts: $groupedProducts, menuOrder: $menuOrder, priceHtml: $priceHtml, relatedIds: $relatedIds, metaData: $metaData, stockStatus: $stockStatus, hasOptions: $hasOptions, yoastHead: $yoastHead, yoastHeadJson: $yoastHeadJson, links: $links)';
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
