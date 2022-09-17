require "spec"
require "../src/cr_verify_playground_client"
require "webmock"
Spec.before_each &->WebMock.reset
