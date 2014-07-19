@IndexCtrl = ($scope, $http) ->
  $scope.dfResult = ""
  $scope.parserResult=["/SampleFileSys1","/SampleFileSys2"]

  $scope.clearForm = ->
    $scope.dfResult = ''
    $scope.parserResult = []
  
  $scope.startParser = ->
    console.log($scope.dfResult);
    console.log($scope.parserResult);
    if $scope.dfResult == ''
        alert("You didn't paste anything");
        return false
    
    post = df_result: $scope.dfResult
    console.log(post)
    $http.post("./parser.json", post).success( (data) ->
        $scope.parserResult = data
        console.log(data);
    ).error( ->
      console.error("Failed to call startParser")
    )
  
   return true

