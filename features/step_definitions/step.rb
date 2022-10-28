class HierarchicDesignator
  attr_reader :namespace_id, :universal_id, :universal_id_type

  def initialize(namespace_id, hash = {})
    @namespace_id = namespace_id
    @universal_id = hash[:universal_id]
    @universal_id_type = hash[:universal_id_type]
  end
end

Given('Patient ID contains {string} as {string}') do |string, string2|
  @assigning_authority = HierarchicDesignator.new(string2, universal_id: '1.2.250.1.213.1.4.8', universal_id_type: 'ISO')
  @id_number = string
end

Given('Identity Reliability Code equals {string}') do |string|
	@identity_reliability_code = string
end

When('I send the HL7 OML O21 message') do
  @oml_o21_nw_message = Hl7MessageFactory.build(:oml_o21_message)
  pid = hl7_message.getSegment(PidSegment.java_class)
  pid.PID_3_2_1_1 = @id_number
  pid.PID_3_2_4_1 = @assigning_authority.namespace_id
  pid.PID_3_2_4_2 = @assigning_authority.universal_id
  pid.PID_3_2_4_3 = @assigning_authority.universal_id_type
  pid.PID_32 = @identity_reliability_code
  mllp_client = MllpHl7Client.new(translator_mllp_host, translator_mllp_port)
  mllp_client.connect
  @orl_o22_response_message = mllp_client.send(@oml_o21_nw_message, Channel.new, translator_mllp_timeout)
	mllp_client.disconnect
end

Then('the patient of the created order should have an identification with code {string} assigned by {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

