# typed: strict

module Zet
  class OperationReport
    extend T::Sig

    sig { params(start_time: Time, end_time: Time, operation_name: String).void }
    def initialize(start_time:, end_time:, operation_name:)
      @start_time = start_time
      @end_time = end_time
      @operation_name = operation_name
    end

    sig { returns(String) }
    def to_s
      "#{@operation_name} #{@start_time - @end_time}"
    end
  end

  # A module for timing operations.
  module Timer
    extend T::Sig

    sig do
      params(
        operation_name: String,
        _block: T.proc.returns(T.untyped)
      ).returns(OperationReport)
    end
    def self.operation(operation_name, &_block)
      start_time = Time.now
      yield
      end_time = Time.now
      OperationReport.new(start_time:, end_time:, operation_name:)
    end
  end
end
