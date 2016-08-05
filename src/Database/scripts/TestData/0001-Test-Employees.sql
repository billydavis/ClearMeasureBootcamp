INSERT INTO [dbo].[Employee]
           ([Id],[UserName],[FirstName],[LastName],[EmailAddress],[Type])
VALUES
           (NewId(),'pgibbins','Peter','Gibbons','pgibbins@initech.com','ClearMeasure.Bootcamp.Core.Model.Employee'),
		   (NewId(),'mbolton','Michael','Bolton','mbolton@initech.com','ClearMeasure.Bootcamp.Core.Model.Employee'),
		   (NewId(),'samir','Samir','Nagheenanajar','snagheenanajar@initech.com','ClearMeasure.Bootcamp.Core.Model.Employee'),
		   (NewId(),'blumberg','Bill','Lumbergh','blumbergh@initech.com','ClearMeasure.Bootcamp.Core.Model.Employee'),
		   (NewId(),'bslydell','Bob','Slydell','bslydell@initech.com','ClearMeasure.Bootcamp.Core.Model.Employee'),
		   (NewId(),'bporter','Bob','Porter','bporter@initech.com','ClearMeasure.Bootcamp.Core.Model.Employee');
		   