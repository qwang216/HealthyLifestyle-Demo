//
//  ResponseMapper.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/13/21.
//

import Foundation

protocol ResponseMapper {
    func parseHTTPReponse(_ apiResponse: APIResponse) -> Result<Data, APIError>
}

extension ResponseMapper {
    func parseHTTPReponse(_ apiResponse: APIResponse) -> Result<Data, APIError> {
        guard let response = apiResponse.response, 200...299 ~= response.statusCode else {
            return .failure(.statusCode(apiResponse.response?.statusCode))
        }
        guard let validData = apiResponse.data else { return .failure(.invalidData) }
        return .success(validData)
    }
}
