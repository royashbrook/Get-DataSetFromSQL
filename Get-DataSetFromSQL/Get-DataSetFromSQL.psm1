function Get-DataSetFromSQL($sql,$cs){
    $ds = new-object System.Data.DataSet
    $da = new-object System.Data.SqlClient.SqlDataAdapter $sql,$cs 
    $da.SelectCommand.CommandTimeout = 1800
    [void] $da.Fill($ds)
    [void] $da.Dispose()
    return ,$ds # https://stackoverflow.com/questions/13974676/why-does-powershell-think-im-trying-to-return-an-object-rather-then-a-datatab
}
Export-ModuleMember -Function Get-DataSetFromSQL