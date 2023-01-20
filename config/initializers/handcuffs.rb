Handcuffs.configure do |config|
  config.phases = %i[
    structure
    finalize_structure
    data_migration
    structure_removal
  ]
  config.default_phase = :structure
end
