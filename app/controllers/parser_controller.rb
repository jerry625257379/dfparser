class ParserController < ApplicationController
  respond_to :json

  def create
     df_result_string = params[:df_result]
     lines = df_result_string.split(/\n/)
     parser_result = []
     usedIndex = 4
     avaliableIndex = 3
     usedThresh = 80
     fileSysIdex = 0
     avaliableThresh = 2097152
     arrays = []
     lines.to_a.each do |line|
         values = line.split(/ +/)
         arrays.push(values)
         puts values[usedIndex]
         puts values[usedIndex].to_f
         if values[usedIndex].to_f > usedThresh and values[avaliableIndex].to_i < avaliableThresh
           parser_result.push(values[fileSysIdex])
         end
     end 
     respond_with(parser_result) do |format|
      format.json { render :json => parser_result.as_json }
    end
  end
end
