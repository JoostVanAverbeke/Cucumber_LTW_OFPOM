Feature: Is the HL7 PID.3 INS identification imported when PID.32 equals "VALI"?

  Scenario: PID.3 contains a INS-NIR
    Given Patient ID contains "542183451" as "INS-NIR"
    Given Identity Reliability Code equals "VALI"
    When I send the HL7 OML O21 message
    Then the patient of the created order should have an identification with code "542183451" assigned by "INS-NIR"

