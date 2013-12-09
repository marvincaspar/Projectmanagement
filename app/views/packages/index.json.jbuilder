json.array!(@packages) do |package|
  json.extract! package, :id, :title, :project_id, :prev_package_id, :employee_id, :risk_id
  json.url package_url(package, format: :json)
end
