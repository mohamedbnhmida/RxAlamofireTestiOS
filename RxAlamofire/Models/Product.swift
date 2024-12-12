//
//  Product.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
// 

import Foundation

// MARK: - Product
struct ProductResponse: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - ProductElement
struct Product: Codable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: String
    let barcode: String
    let qrCode: String
}
  // MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName, reviewerEmail: String
}
