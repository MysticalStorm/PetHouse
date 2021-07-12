import Foundation

protocol EndpointProtocol: RawRepresentable where RawValue == String { }

protocol RequestProtocol {
  associatedtype T: EndpointProtocol
  
  var endpoint: T { get }
}
