@{
    name         = @{
        familyName = 'familyName'
        givenName  = 'givenName'
    }
    active       = 'Active'
    userName     = 'userName'
    displayName  = 'displayName'
    userType     = 'userType'
    title        = 'title'
    "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User" = @{
        employeeNumber = 'WorkerID'
        costCenter     = 'CostCenter'
        organization   = 'Company'
        division       = 'Division'
        department     = 'Department'
        manager        = @{
            value = 'ManagerID'
        }
    }
}