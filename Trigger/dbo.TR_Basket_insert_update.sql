create or alter trigger dbo.TR_Basket_insert_update on dbo.Basket
after insert
as
begin
	update dbo.Basket
	set DiscountValue = [Value] * 0.05
	where ID_SKU in	(select ID_SKU 
                  	from inserted 
                  	group by ID_SKU
			having count(*) >= 2)
end
