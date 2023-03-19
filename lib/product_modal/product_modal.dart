// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Product> welcomeFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String welcomeToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<ImageList> defaultImageList = [
  ImageList(
      id: 99999,
      dateCreated: DateTime.now(),
      alt: '',
      dateCreatedGmt: DateTime.now(),
      dateModified: DateTime.now(),
      name: 'no data',
      dateModifiedGmt: DateTime.now(),
      src: '')
];
List<Category> defaultCategory = [
  Category(id: 99999, name: 'error, no data', slug: '')
];

class Product {
  Product({
    required this.id,
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
    this.categories,
    this.tags,
    required this.images,
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
    // this.yoastHeadJson,
    this.links,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? permalink;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final WelcomeType? type;
  final Status? status;
  final bool? featured;
  final CatalogVisibility? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final dynamic dateOnSaleFrom;
  final dynamic dateOnSaleFromGmt;
  final dynamic dateOnSaleTo;
  final dynamic dateOnSaleToGmt;
  final bool? onSale;
  final bool? purchasable;
  final int? totalSales;
  final bool? virtual;
  final bool? downloadable;
  final List<dynamic>? downloads;
  final int? downloadLimit;
  final int? downloadExpiry;
  final String? externalUrl;
  final String? buttonText;
  final TaxStatus? taxStatus;
  final String? taxClass;
  final bool? manageStock;
  final dynamic stockQuantity;
  final Backorders? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final dynamic lowStockAmount;
  final bool? soldIndividually;
  final String? weight;
  final Dimensions? dimensions;
  final bool? shippingRequired;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? averageRating;
  final int? ratingCount;
  final List<dynamic>? upsellIds;
  final List<dynamic>? crossSellIds;
  final int? parentId;
  final String? purchaseNote;
  final List<Category>? categories;
  final List<Category>? tags;
  final List<ImageList> images;
  final List<dynamic>? attributes;
  final List<dynamic>? defaultAttributes;
  final List<dynamic>? variations;
  final List<dynamic>? groupedProducts;
  final int? menuOrder;
  final String? priceHtml;
  final List<int>? relatedIds;
  final List<MetaDatum>? metaData;
  final StockStatus? stockStatus;
  final bool? hasOptions;
  final String? yoastHead;
  final Links? links;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        type: welcomeTypeValues.map[json["type"]]!,
        featured: json["featured"],
        catalogVisibility:
            catalogVisibilityValues.map[json["catalog_visibility"]]!,
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: json["downloads"] == null
            ? []
            : List<dynamic>.from(json["downloads"]!.map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: taxStatusValues.map[json["tax_status"]]!,
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: backordersValues.map[json["backorders"]]!,
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: json["upsell_ids"] == null
            ? []
            : List<dynamic>.from(json["upsell_ids"]!.map((x) => x)),
        crossSellIds: json["cross_sell_ids"] == null
            ? []
            : List<dynamic>.from(json["cross_sell_ids"]!.map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: json["categories"] == null
            ? defaultCategory
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<Category>.from(
                json["tags"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? defaultImageList
            : List<ImageList>.from(
                json["images"]!.map((x) => ImageList.fromJson(x))),
        attributes: json["attributes"] == null
            ? []
            : List<dynamic>.from(json["attributes"]!.map((x) => x)),
        defaultAttributes: json["default_attributes"] == null
            ? []
            : List<dynamic>.from(json["default_attributes"]!.map((x) => x)),
        variations: json["variations"] == null
            ? []
            : List<dynamic>.from(json["variations"]!.map((x) => x)),
        groupedProducts: json["grouped_products"] == null
            ? []
            : List<dynamic>.from(json["grouped_products"]!.map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: json["related_ids"] == null
            ? []
            : List<int>.from(json["related_ids"]!.map((x) => x)),
        metaData: json["meta_data"] == null
            ? []
            : List<MetaDatum>.from(
                json["meta_data"]!.map((x) => MetaDatum.fromJson(x))),
        stockStatus: stockStatusValues.map[json["stock_status"]]!,
        hasOptions: json["has_options"],
        yoastHead: json["yoast_head"],
        // yoastHeadJson: json["yoast_head_json"] == null
        // ? null
        // : YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "type": welcomeTypeValues.reverse[type],
        "status": statusValues.reverse[status],
        "featured": featured,
        "catalog_visibility":
            catalogVisibilityValues.reverse[catalogVisibility],
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": downloads == null
            ? []
            : List<dynamic>.from(downloads!.map((x) => x)),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatusValues.reverse[taxStatus],
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backordersValues.reverse[backorders],
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids": upsellIds == null
            ? []
            : List<dynamic>.from(upsellIds!.map((x) => x)),
        "cross_sell_ids": crossSellIds == null
            ? []
            : List<dynamic>.from(crossSellIds!.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x)),
        "default_attributes": defaultAttributes == null
            ? []
            : List<dynamic>.from(defaultAttributes!.map((x) => x)),
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x)),
        "grouped_products": groupedProducts == null
            ? []
            : List<dynamic>.from(groupedProducts!.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": relatedIds == null
            ? []
            : List<dynamic>.from(relatedIds!.map((x) => x)),
        "meta_data": metaData == null
            ? []
            : List<dynamic>.from(metaData!.map((x) => x.toJson())),
        "stock_status": stockStatusValues.reverse[stockStatus],
        "has_options": hasOptions,
        "yoast_head": yoastHead,
        // "yoast_head_json": yoastHeadJson?.toJson(),
        "_links": links?.toJson(),
      };
}

enum Backorders { NO }

final backordersValues = EnumValues({"no": Backorders.NO});

enum CatalogVisibility { VISIBLE }

final catalogVisibilityValues =
    EnumValues({"visible": CatalogVisibility.VISIBLE});

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  final int? id;
  final String? name;
  final String? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  final String? length;
  final String? width;
  final String? height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };
}

class ImageList {
  ImageList({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
        id: json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  final List<Collection>? self;
  final List<Collection>? collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? []
            : List<Collection>.from(
                json["self"]!.map((x) => Collection.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<Collection>.from(
                json["collection"]!.map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
      };
}

class Collection {
  Collection({
    this.href,
  });

  final String? href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class MetaDatum {
  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  final int? id;
  final String? key;
  final dynamic value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

enum StockStatus { INSTOCK }

final stockStatusValues = EnumValues({"instock": StockStatus.INSTOCK});

enum TaxStatus { TAXABLE }

final taxStatusValues = EnumValues({"taxable": TaxStatus.TAXABLE});

enum WelcomeType { SIMPLE }

final welcomeTypeValues = EnumValues({"simple": WelcomeType.SIMPLE});

class OgImage {
  OgImage({
    this.width,
    this.height,
    this.url,
    this.type,
  });

  final int? width;
  final int? height;
  final String? url;
  final OgImageType? type;

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        type: ogImageTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "type": ogImageTypeValues.reverse[type],
      };
}

enum OgImageType { IMAGE_JPEG }

final ogImageTypeValues = EnumValues({"image/jpeg": OgImageType.IMAGE_JPEG});

enum OgLocale { EN_US }

final ogLocaleValues = EnumValues({"en_US": OgLocale.EN_US});

enum OgSiteName { RACING_CUSTOM_PARTS }

final ogSiteNameValues =
    EnumValues({"Racing Custom Parts": OgSiteName.RACING_CUSTOM_PARTS});

enum OgType { ARTICLE }

final ogTypeValues = EnumValues({"article": OgType.ARTICLE});

class Robots {
  Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  final Index? index;
  final Follow? follow;
  final MaxSnippet? maxSnippet;
  final MaxImagePreview? maxImagePreview;
  final MaxVideoPreview? maxVideoPreview;

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: indexValues.map[json["index"]]!,
        follow: followValues.map[json["follow"]]!,
        maxSnippet: maxSnippetValues.map[json["max-snippet"]]!,
        maxImagePreview: maxImagePreviewValues.map[json["max-image-preview"]]!,
        maxVideoPreview: maxVideoPreviewValues.map[json["max-video-preview"]]!,
      );

  Map<String, dynamic> toJson() => {
        "index": indexValues.reverse[index],
        "follow": followValues.reverse[follow],
        "max-snippet": maxSnippetValues.reverse[maxSnippet],
        "max-image-preview": maxImagePreviewValues.reverse[maxImagePreview],
        "max-video-preview": maxVideoPreviewValues.reverse[maxVideoPreview],
      };
}

enum Follow { FOLLOW }

final followValues = EnumValues({"follow": Follow.FOLLOW});

enum Index { INDEX }

final indexValues = EnumValues({"index": Index.INDEX});

enum MaxImagePreview { MAX_IMAGE_PREVIEW_LARGE }

final maxImagePreviewValues = EnumValues(
    {"max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE});

enum MaxSnippet { MAX_SNIPPET_1 }

final maxSnippetValues =
    EnumValues({"max-snippet:-1": MaxSnippet.MAX_SNIPPET_1});

enum MaxVideoPreview { MAX_VIDEO_PREVIEW_1 }

final maxVideoPreviewValues =
    EnumValues({"max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1});

class Breadcrumb {
  Breadcrumb({
    this.id,
  });

  final String? id;

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

enum Description { IF_YOU_CAN_T_FIND_PARTS_FOR_YOUR_CAR_WE_CAN_DO_IT }

final descriptionValues = EnumValues({
  "If you can’t find parts for your car, we can do it":
      Description.IF_YOU_CAN_T_FIND_PARTS_FOR_YOUR_CAR_WE_CAN_DO_IT
});

enum InLanguage { EN_US }

final inLanguageValues = EnumValues({"en-US": InLanguage.EN_US});

class ItemListElement {
  ItemListElement({
    this.type,
    this.position,
    this.name,
    this.item,
  });

  final ItemListElementType? type;
  final int? position;
  final String? name;
  final String? item;

  factory ItemListElement.fromJson(Map<String, dynamic> json) =>
      ItemListElement(
        type: itemListElementTypeValues.map[json["@type"]]!,
        position: json["position"],
        name: json["name"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": itemListElementTypeValues.reverse[type],
        "position": position,
        "name": name,
        "item": item,
      };
}

enum ItemListElementType { LIST_ITEM }

final itemListElementTypeValues =
    EnumValues({"ListItem": ItemListElementType.LIST_ITEM});

class PotentialAction {
  PotentialAction({
    this.type,
    this.target,
    this.queryInput,
  });

  final PotentialActionType? type;
  final dynamic target;
  final QueryInput? queryInput;

  factory PotentialAction.fromJson(Map<String, dynamic> json) =>
      PotentialAction(
        type: potentialActionTypeValues.map[json["@type"]]!,
        target: json["target"],
        queryInput: queryInputValues.map[json["query-input"]]!,
      );

  Map<String, dynamic> toJson() => {
        "@type": potentialActionTypeValues.reverse[type],
        "target": target,
        "query-input": queryInputValues.reverse[queryInput],
      };
}

enum QueryInput { REQUIRED_NAME_SEARCH_TERM_STRING }

final queryInputValues = EnumValues({
  "required name=search_term_string":
      QueryInput.REQUIRED_NAME_SEARCH_TERM_STRING
});

class TargetClass {
  TargetClass({
    this.type,
    this.urlTemplate,
  });

  final TargetType? type;
  final UrlTemplate? urlTemplate;

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: targetTypeValues.map[json["@type"]]!,
        urlTemplate: urlTemplateValues.map[json["urlTemplate"]]!,
      );

  Map<String, dynamic> toJson() => {
        "@type": targetTypeValues.reverse[type],
        "urlTemplate": urlTemplateValues.reverse[urlTemplate],
      };
}

enum TargetType { ENTRY_POINT }

final targetTypeValues = EnumValues({"EntryPoint": TargetType.ENTRY_POINT});

enum UrlTemplate { HTTPS_RACINGCUSTOMPARTS_COM_S_SEARCH_TERM_STRING }

final urlTemplateValues = EnumValues({
  "https://racingcustomparts.com/?s={search_term_string}":
      UrlTemplate.HTTPS_RACINGCUSTOMPARTS_COM_S_SEARCH_TERM_STRING
});

enum PotentialActionType { READ_ACTION, SEARCH_ACTION }

final potentialActionTypeValues = EnumValues({
  "ReadAction": PotentialActionType.READ_ACTION,
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType { WEB_PAGE, BREADCRUMB_LIST, WEB_SITE }

final graphTypeValues = EnumValues({
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "WebPage": GraphType.WEB_PAGE,
  "WebSite": GraphType.WEB_SITE
});

enum TwitterCard { SUMMARY_LARGE_IMAGE }

final twitterCardValues =
    EnumValues({"summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
