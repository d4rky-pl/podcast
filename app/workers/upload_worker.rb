class UploadWorker < ::CarrierWave::Workers::ProcessAsset

  def perform(*args)
    set_args(*args) if args.present?
    model = constantized_resource.find id

    run_callback model, :before_upload
    super(*args)
    run_callback model, :after_upload_success

  rescue
    run_callback model, :after_upload_failure, $!.message

    Rails.logger.tagged 'UploadWorker' do
      Rails.logger.error "ERROR DURING UPLOADING: #{$!.message}"
      $!.backtrace.each { |line| Rails.logger.error line }
    end
  end

  def run_callback(model, callback, message=nil)
    if model.respond_to?("may_#{callback}?") && model.send("may_#{callback}?")
      Rails.logger.debug "Running callback: #{callback}! for model #{model}"
      model.send("#{callback}!", message)
    elsif model.respond_to?(callback)
      Rails.logger.debug "Running callback: #{callback} for model #{model}"
      model.send(callback, message)
    else
      Rails.logger.debug "Unable to run callback: #{callback} for model #{model}"
    end
  end
end

