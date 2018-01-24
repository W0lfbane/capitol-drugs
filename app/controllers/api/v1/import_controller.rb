class Api::V1::ImportController < ApiController
  protect_from_forgery with: :null_session

  def csv
    logger.debug "#{params}"

    if ImportUtil.import_csv(params[:spreadsheet])
      render plain: "OK"
    else
      render plain: "Problem"
    end
  end

  private
    def import_params
        params.permit(:spreadsheet)
    end
end
