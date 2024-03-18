CREATE TABLE IF NOT EXISTS application_attachments /* TOWER_PUBACC_AT */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    attachment_code TEXT,
    description TEXT,
    date TEXT
);

CREATE TABLE IF NOT EXISTS application_coordinates /* TOWER_PUBACC_CO */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    coordinate_type TEXT,
    latitude_degrees NUMBER,
    latitude_minutes NUMBER,
    latitude_seconds NUMBER,
    latitude_direction TEXT,
    latitude_total_seconds NUMBER,
    longitude_degrees NUMBER,
    longitude_minutes NUMBER,
    longitude_seconds NUMBER,
    longitude_direction TEXT,
    longitude_total_seconds NUMBER,
    array_tower_position NUMBER,
    array_total_tower NUMBER
);

CREATE TABLE IF NOT EXISTS registration_entities /* TOWER_PUBACC_EN */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    entity_type TEXT NOT NULL,
    entity_type_code TEXT,
    entity_type_other TEXT,
    licensee_id TEXT,
    entity_name TEXT,
    first_name TEXT,
    mi TEXT,
    last_name TEXT,
    suffix TEXT,
    phone TEXT,
    fax TEXT,
    internet_address TEXT,
    street_address TEXT,
    street_address2 TEXT,
    po_box TEXT,
    city TEXT,
    state TEXT,
    zip_code TEXT,
    attention TEXT,
    frn TEXT
);

CREATE TABLE IF NOT EXISTS registration_history /* TOWER_PUBACC_HS */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    date TEXT,
    description TEXT
);

CREATE TABLE IF NOT EXISTS registration_data /* TOWER_PUBACC_RA */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    application_purpose TEXT,
    previous_purpose TEXT,
    input_source_code TEXT,
    status_code TEXT,
    date_entered TEXT,
    date_received TEXT,
    date_issued TEXT,
    date_constructed TEXT,
    date_dismantled TEXT,
    date_action TEXT,
    archive_flag_code TEXT,
    version NUMBER,
    signature_first_name TEXT,
    signature_middle_initial TEXT,
    signature_last_name TEXT,
    signature_suffix TEXT,
    signature_title TEXT,
    invalid_signature TEXT,
    structure_street_address TEXT,
    structure_city TEXT,
    structure_state_code TEXT,
    county_code TEXT,
    zip_code TEXT,
    height_of_structure NUMBER,
    ground_elevation NUMBER,
    overall_height_above_ground NUMBER,
    overall_height_amsl NUMBER,
    structure_type TEXT,
    date_faa_determination_issued TEXT,
    faa_study_number TEXT,
    faa_circular_number TEXT,
    specification_option NUMBER,
    painting_and_lighting TEXT,
    mark_light_code TEXT,
    mark_light_other TEXT,
    faa_emi_flag TEXT,
    nepa_flag TEXT,
    date_signed TEXT,
    signature_last_or TEXT,
    signature_first_or TEXT,
    signature_mi_or TEXT,
    signature_suffix_or TEXT,
    title_signed_or TEXT,
    date_signed_or TEXT
);

CREATE TABLE IF NOT EXISTS registration_remarks /* TOWER_PUBACC_RE */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    remark_type TEXT,
    date_keyed TEXT,
    sequence_number NUMBER,
    remark_text TEXT
);

CREATE TABLE IF NOT EXISTS application_reasons /* TOWER_PUBACC_RS */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    reason_type TEXT,
    reason_description TEXT,
    reason_comment TEXT,
    reason_date TEXT
);

CREATE TABLE IF NOT EXISTS application_special_conditions /* TOWER_PUBACC_SC */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    date_keyed TEXT,
    sequence_number NUMBER,
    remark_text TEXT
);

CREATE TABLE IF NOT EXISTS application_environmental_compliance_data /* TOWER_PUBACC_EC */ (
    record_type TEXT,
    content_indicator TEXT,
    file_number TEXT,
    registration_number TEXT,
    unique_system_identifier NUMBER NOT NULL,
    waiver_flag TEXT,
    other_federal_flag TEXT,
    fed_lands_type TEXT,
    fed_agency_name TEXT,
    national_notice_date TEXT,
    env_assessment_flag	 TEXT,
    env_cert_flag TEXT,
    env_cert_basis TEXT,
    local_notice_date TEXT
);

CREATE INDEX IF NOT EXISTS application_attachments_pkey ON application_attachments (unique_system_identifier);
CREATE INDEX IF NOT EXISTS application_coordinates_pkey ON application_coordinates (unique_system_identifier);
CREATE INDEX IF NOT EXISTS application_reasons_pkey ON application_reasons (unique_system_identifier);
CREATE INDEX IF NOT EXISTS application_special_conditions_pkey ON application_special_conditions (unique_system_identifier);
CREATE INDEX IF NOT EXISTS application_environmental_compliance_data_pkey ON application_environmental_compliance_data (unique_system_identifier);

CREATE INDEX IF NOT EXISTS registration_entities_pkey ON registration_entities (unique_system_identifier);
CREATE INDEX IF NOT EXISTS registration_history_pkey ON registration_history (unique_system_identifier);
CREATE INDEX IF NOT EXISTS registration_data_pkey ON registration_data (unique_system_identifier);
CREATE INDEX IF NOT EXISTS registration_remarks_pkey ON registration_remarks (unique_system_identifier);
