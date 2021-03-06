USE [dbProductContext]
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductFindByName]    Script Date: 27/02/2019 22:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		André Yeiki da Costa
-- Create date: 24/02/2019
-- Description:	Realiza busca de produtos por nome
-- =============================================
ALTER PROCEDURE [dbo].[usp_ProductFindByName]
	@str_Name VARCHAR(200) = NULL
AS
BEGIN

	SET NOCOUNT ON;

    SELECT Product.Id, 
	Product.[Name], 
	Product.[Price], 
	Product.[Image], 
	Product.[Description], 
	Product.RegisterDate, 
	Product.IdCategory,
	Category.[Name],
	Category.IdParent
	FROM Product
	INNER JOIN Category ON Category.Id = Product.IdCategory
	WHERE Product.[Name] LIKE '%' + @str_Name + '%'
	 
END
