USE [HistoricalFulfillment]
GO
/****** Object:  Table [dbo].[FollowUp]    Script Date: 01/15/2012 20:18:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowUp](
	[FollowUpId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryId] [int] NOT NULL,
	[PaymentId] [int] NOT NULL,
	[FollowUpDateTime] [datetime] NOT NULL,
	[HashCode] [int] NOT NULL,
 CONSTRAINT [PK_FollowUp] PRIMARY KEY CLUSTERED 
(
	[FollowUpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FollowUp]  WITH CHECK ADD  CONSTRAINT [FK_FollowUp_Delivery] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveryId])
GO
ALTER TABLE [dbo].[FollowUp] CHECK CONSTRAINT [FK_FollowUp_Delivery]
GO
ALTER TABLE [dbo].[FollowUp]  WITH CHECK ADD  CONSTRAINT [FK_FollowUp_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
GO
ALTER TABLE [dbo].[FollowUp] CHECK CONSTRAINT [FK_FollowUp_Payment]
GO
