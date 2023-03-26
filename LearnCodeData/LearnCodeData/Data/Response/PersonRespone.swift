import Foundation

// MARK: - WelcomeElement
struct Person: Codable {
    let id: Int
    let uid, password, firstName, lastName: String
    let username, email: String
    let avatar: String
    let gender, phoneNumber, socialInsuranceNumber, dateOfBirth: String
    let employment: Employment
    let address: Address
    let creditCard: CreditCard
    let subscription: Subscription

    enum CodingKeys: String, CodingKey {
        case id, uid, password
        case firstName = "first_name"
        case lastName = "last_name"
        case username, email, avatar, gender
        case phoneNumber = "phone_number"
        case socialInsuranceNumber = "social_insurance_number"
        case dateOfBirth = "date_of_birth"
        case employment, address
        case creditCard = "credit_card"
        case subscription
    }
}

// MARK: - Address
struct Address: Codable {
    let city, streetName, streetAddress, zipCode: String
    let state: String
    let country: Country
    let coordinates: Coordinates1

    enum CodingKeys: String, CodingKey {
        case city
        case streetName = "street_name"
        case streetAddress = "street_address"
        case zipCode = "zip_code"
        case state, country, coordinates
    }
}

// MARK: - Coordinates
struct Coordinates1: Codable {
    let lat, lng: Double
}

enum Country: String, Codable {
    case unitedStates = "United States"
}

// MARK: - CreditCard
struct CreditCard: Codable {
    let ccNumber: String

    enum CodingKeys: String, CodingKey {
        case ccNumber = "cc_number"
    }
}

// MARK: - Employment
struct Employment: Codable {
    let title, keySkill: String

    enum CodingKeys: String, CodingKey {
        case title
        case keySkill = "key_skill"
    }
}

// MARK: - Subscription
struct Subscription: Codable {
    let plan: String
    let status: String
    let paymentMethod, term: String

    enum CodingKeys: String, CodingKey {
        case plan, status
        case paymentMethod = "payment_method"
        case term
    }
}
