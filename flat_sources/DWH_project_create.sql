USE [DWH_Project]
GO

/****** Object:  Table [dbo].[Cities]    Script Date: 12.06.2022 13:18:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cities](
	[county_fips_codes] [int] NOT NULL,
	[density] [int] NULL,
	[city_name] [nvarchar](40) NOT NULL,
	[state_name] [nvarchar](40) NOT NULL,
	[latitude] [float] NOT NULL,
	[is_military_city] [nvarchar](40) NOT NULL,
	[longtitude] [float] NOT NULL,
	[state_abbreviation] [nvarchar](40) NOT NULL,
	[county_name] [nvarchar](40) NOT NULL,
	[population] [int] NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO  

CREATE TABLE [dbo].[OrdersFacts](
	[order_date_id] [int] NOT NULL,
	[order_product_id] [bigint] NOT NULL,
	[order_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[order_number] [int] NOT NULL,
	[order_hour_of_day] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[product_id] [int] NOT NULL,
	[add_to_cart_order] [int] NOT NULL,
	[is_reordered] [nvarchar](40) NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_OrdersFacts] PRIMARY KEY CLUSTERED 
(
	[order_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Products](
	[department_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[aisle_id] [int] NOT NULL,
	[aisle] [nvarchar](40) NOT NULL,
	[department] [nvarchar](40) NOT NULL,
	[product_name] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Users](
	[gender] [nvarchar](40) NOT NULL,
	[phone] [nvarchar](40) NOT NULL,
	[user_id] [int] NOT NULL,
	[last_name] [nvarchar](40) NOT NULL,
	[first_name] [nvarchar](40) NOT NULL,
	[email] [nvarchar](40) NOT NULL,
	[age] [float] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Weather](
	[severity] [nvarchar](40) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_date_id] [int] NOT NULL,
	[event_id] [nvarchar](40) NOT NULL,
	[city_name] [nvarchar](40) NOT NULL,
	[weather_type] [nvarchar](40) NOT NULL,
	[end_time] [datetime] NOT NULL,
	[precipitation_inches] [float] NOT NULL,
	[start_date_id] [int] NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_Weather_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Weather]  WITH CHECK ADD  CONSTRAINT [FK_Weather_Cities] FOREIGN KEY([city_id])
REFERENCES [dbo].[Cities] ([city_id])
GO

ALTER TABLE [dbo].[Weather] CHECK CONSTRAINT [FK_Weather_Cities]
GO

ALTER TABLE [dbo].[Weather]  WITH CHECK ADD  CONSTRAINT [FK_Weather_DateDimension] FOREIGN KEY([start_date_id])
REFERENCES [dbo].[DateDimension] ([DateID])
GO

ALTER TABLE [dbo].[Weather] CHECK CONSTRAINT [FK_Weather_DateDimension]
GO

ALTER TABLE [dbo].[Weather]  WITH CHECK ADD  CONSTRAINT [FK_Weather_DateDimension1] FOREIGN KEY([end_date_id])
REFERENCES [dbo].[DateDimension] ([DateID])
GO

ALTER TABLE [dbo].[Weather] CHECK CONSTRAINT [FK_Weather_DateDimension1]
GO



ALTER TABLE [dbo].[OrdersFacts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersFacts_Cities] FOREIGN KEY([city_id])
REFERENCES [dbo].[Cities] ([city_id])
GO

ALTER TABLE [dbo].[OrdersFacts] CHECK CONSTRAINT [FK_OrdersFacts_Cities]
GO

ALTER TABLE [dbo].[OrdersFacts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersFacts_DateDimension] FOREIGN KEY([order_date_id])
REFERENCES [dbo].[DateDimension] ([DateID])
GO

ALTER TABLE [dbo].[OrdersFacts] CHECK CONSTRAINT [FK_OrdersFacts_DateDimension]
GO

ALTER TABLE [dbo].[OrdersFacts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersFacts_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO

ALTER TABLE [dbo].[OrdersFacts] CHECK CONSTRAINT [FK_OrdersFacts_Products]
GO

ALTER TABLE [dbo].[OrdersFacts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersFacts_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO

ALTER TABLE [dbo].[OrdersFacts] CHECK CONSTRAINT [FK_OrdersFacts_Users]
GO


