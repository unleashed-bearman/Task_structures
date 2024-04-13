create or alter procedure dbo.usp_MakeFamilyPurchase(@FamilySurName varchar(255))
as
begin
		if @FamilySurname not in (select SurName from dbo.Family)
			raiserror('No such family', 16, 10);
		update dbo.Family
		set BudgetValue -= (select sum(Value) from dbo.Basket where ID_Family = dbo.Family.id)
		where dbo.Family.SurName = @FamilySurName;
end
