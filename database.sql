CREATE DATABASE [BD401]
GO
USE [BD401]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[venta]') AND type in (N'U'))
ALTER TABLE [dbo].[venta] DROP CONSTRAINT IF EXISTS [FK__venta__idCliente__3B75D760]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle]') AND type in (N'U'))
ALTER TABLE [dbo].[detalle] DROP CONSTRAINT IF EXISTS [FK__detalle__idVenta__3E52440B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle]') AND type in (N'U'))
ALTER TABLE [dbo].[detalle] DROP CONSTRAINT IF EXISTS [FK__detalle__idProdu__3F466844]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 09/05/2025 8:53:01 ******/
DROP TABLE IF EXISTS [dbo].[venta]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 09/05/2025 8:53:01 ******/
DROP TABLE IF EXISTS [dbo].[producto]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 09/05/2025 8:53:01 ******/
DROP TABLE IF EXISTS [dbo].[detalle]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 09/05/2025 8:53:01 ******/
DROP TABLE IF EXISTS [dbo].[cliente]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 09/05/2025 8:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[numruc] [varchar](11) NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 09/05/2025 8:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 09/05/2025 8:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[categoria] [varchar](100) NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 09/05/2025 8:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecventa] [datetime] NULL,
	[idCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (1, N'ACS INDUSTRIA METAL MECANICA E.I.R.L.', N'20458127400', N'LIMA', N'999888101')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (2, N'AQUILES MARCELINO AGUILAR ZACAR?AS', N'10161204396', N'LIMA', N'999888102')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (3, N'ATLAS MOTOS E.I.R.LTDA.', N'20406502377', N'PUNO', N'999888103')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (4, N'CARROCERIAS INTEGRADAS S.A. - CAISA', N'20331634281', N'LIMA', N'999888104')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (5, N'CARROCERIAS SAN LUIS E.I.R.L.', N'20102259735', N'LIMA', N'999888105')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (6, N'CESAR AUGUSTO GARCIA SALAZAR', N'10165286371', N'LIMA', N'999888106')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (7, N'COMPANY BUSINESSES S.A.C.', N'20516333694', N'CALLAO', N'999888107')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (8, N'COMPA?IA INDUSTRIAL DE CARROCERIAS S.A.C.', N'20538154564', N'LIMA', N'999888108')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (9, N'COMPA?IA PERUANA DE REMOLQUES S.A.', N'20135468941', N'CALLAO', N'999888109')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (10, N'CONSERMET S.A.C.', N'20481405999', N'LA LIBERTAD', N'999888110')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (11, N'CORPORACION CAYMAN S.A.C.', N'20493190611', N'LORETO', N'999888111')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (12, N'CORPORACI?N MET?LICA DEL ACERO S.A.C.', N'20513855941', N'CALLAO', N'999888112')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (13, N'CORPORACION WRT S.A.C. - WRT S.A.C.', N'20536160206', N'LIMA', N'999888113')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (14, N'DC EXPREES S.A.C.', N'20600465377', N'LA LIBERTAD', N'999888114')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (15, N'DECO HOGAR E.I.R.L.', N'20527721173', N'MADRE DE DIOS', N'999888115')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (16, N'ECOENERGY S.A.C.', N'20393530244', N'UCAYALI', N'999888116')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (17, N'EHF S.A.C.', N'20600040562', N'LIMA', N'999888117')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (18, N'ESTRUCTURAS METALICAS OLMEDO E.I.R.L.', N'20261624916', N'LIMA', N'999888118')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (19, N'SEMIREMOLQUES Y MAQUINARIAS E.I.R.L.', N'20600220668', N'LIMA', N'999888119')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (20, N'FABRICACION Y SERVICIOS MULTIPLES UCEDA S.A.C.', N'20481952965', N'LA LIBERTAD', N'999888120')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (21, N'MARQUEZ MACHADO E.I.R.L. - FAB. Y SERV. R.M. Y M. E.I.R.L.', N'20454151713', N'AREQUIPA', N'999888121')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (22, N'FABRICACIONES ALCANTARA E.I.R.L.', N'20458841714', N'LIMA', N'999888122')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (23, N'FABRICACIONES BRA S.A.C.', N'20477313214', N'LA LIBERTAD', N'999888123')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (24, N'FABRICACIONES MET?LICAS ARNOLD S.A.C.', N'20477664513', N'LA LIBERTAD', N'999888124')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (25, N'FABRICACIONES METALICAS CARRANZA S.A.C. FAMECA S.A.C.', N'20132108294', N'LA LIBERTAD', N'999888125')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (26, N'FABRICACIONES METALICAS LUJAN S.A.C', N'20481066680', N'LA LIBERTAD', N'999888126')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (27, N'FABRICACIONES METALICAS Y SERVICIOS DIESEL S.A.C - FAMEDI S.A.C.', N'20505769148', N'LIMA', N'999888127')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (28, N'FABRICACIONES MONTOYA S.R.L.', N'20531544090', N'SAN MARTIN', N'999888128')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (29, N'FABRIMETAL S.A.C.', N'20101633820', N'LIMA', N'999888129')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (30, N'FACAMESUR E.I.R.L.', N'20218677640', N'AREQUIPA', N'999888130')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (31, N'FACTORIA ANTONIO PINTO S.A.', N'20100070465', N'LIMA', N'999888131')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (32, N'FACTORIA BARBOZA S.R.L.', N'20486029839', N'JUNIN', N'999888132')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (33, N'FACTORIA FACJOCA S.A.C.', N'20454650043', N'AREQUIPA', N'999888133')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (34, N'FACTORIA FELISUR E.I.R.L.', N'20454773986', N'AREQUIPA', N'999888134')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (35, N'FACTORIA J.C. E.I.R.L.', N'20453910513', N'AREQUIPA', N'999888135')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (36, N'FACTORIA METAL CHOQUE E.I.R.L.', N'20498433210', N'AREQUIPA', N'999888136')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (37, N'FACTORIA PETER BILL INTEX S.R.L.', N'20454114354', N'AREQUIPA', N'999888137')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (38, N'FACTORIA TALLERES ORION E.I.R.L.', N'20454289154', N'AREQUIPA', N'999888138')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (39, N'FACTORIA Y DISTRIBUCIONES SAN JORGE E.I.R.L.', N'20455782598', N'AREQUIPA', N'999888139')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (40, N'MECANICA E INDUSTRIA S.R.L. - FACSEMIN', N'20453947352', N'AREQUIPA', N'999888140')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (41, N'FACTORY MULTISERVICIOS MAG S.R.L.', N'20601745641', N'PUNO', N'999888141')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (42, N'FAMA ANDINA S.A.C.', N'20524006945', N'LA LIBERTAD', N'999888142')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (43, N'FASEPA FACTORIA SE?OR DE PAMPACUCHO E.I.R.L.', N'20498631011', N'AREQUIPA', N'999888143')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (44, N'GRUPO C & R VELOZ S.A.C.', N'20551034021', N'LIMA', N'999888144')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (45, N'GRUPO SERMET S.A.C.', N'20549685316', N'CALLAO', N'999888145')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (46, N'HALCON S.A.', N'20354180911', N'LA LIBERTAD', N'999888146')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (47, N'HONDA SELVA DEL PERU S.A', N'20493508645', N'LORETO', N'999888147')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (48, N'IBIMCO PERU S.A.C.', N'20522599591', N'LIMA', N'999888148')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (49, N'INDUSTRIA CARROCERA DEL PERU S.A.C. - INCAPER', N'20519105676', N'LIMA', N'999888149')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (50, N'INDUSTRIA METALICA BULLON S.A.C.', N'20514745031', N'LIMA', N'999888150')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (51, N'INDUSTRIA METALICAS EL RAFA E.I.R.L.', N'20393095301', N'UCAYALI', N'999888151')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (52, N'INDUSTRIAL UNION S.R.L.', N'20527080445', N'CUSCO', N'999888152')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (53, N'INDUSTRIAS  RODOS  S.R.L.', N'20302083747', N'LIMA', N'999888153')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (54, N'INDUSTRIAS ANCALAYO S.A.C.', N'20568135271', N'JUNIN', N'999888154')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (55, N'INDUSTRIAS FIRME E.I.R.L.', N'20526949065', N'CUSCO', N'999888155')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (56, N'INDUSTRIAS MECANICAS DEL SUR S.A.C.', N'20519775132', N'TACNA', N'999888156')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (57, N'INDUSTRIAS METALICAS ALYER S.R.L.', N'20302830828', N'LIMA', N'999888157')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (58, N'INDUSTRIAS METALICAS AREQUIPA S.A.C.', N'20498196927', N'AREQUIPA', N'999888158')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (59, N'INDUSTRIAS TRICAR S.A.C.', N'20393063956', N'UCAYALI', N'999888159')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (60, N'INKA TRAYLERS S.R.L.', N'20473646804', N'LIMA', N'999888160')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (61, N'J & K INDUBARZA E.I.R.L.', N'20601849519', N'JUNIN', N'999888161')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (62, N'J & S AUTOMOTRIZ ASOCIADOS E.I.R.L.', N'20601333342', N'MADRE DE DIOS', N'999888162')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (63, N'J.K.F. MOTOS PERU S.A.C.', N'20447884624', N'PUNO', N'999888163')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (64, N'JR GROUP INDUSTRIAS S.A.C.', N'20430948076', N'LIMA', N'999888164')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (65, N'JUAN SALVATIERRA CONDEZO', N'10070728996', N'LIMA', N'999888165')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (66, N'L & S NASSI S.A.C.', N'20481103399', N'LA LIBERTAD', N'999888166')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (67, N'LIMA TRAYLERS S.A.C.', N'20504082564', N'LIMA', N'999888167')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (68, N'LQ TRADING IMPORT EXPORT S.A.C.', N'20468450217', N'LIMA', N'999888168')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (69, N'MANUEL AUGUSTO ROCHA DIAZ E.I.R.L.', N'20531350309', N'SAN MARTIN', N'999888169')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (70, N'METALLUM S.A.C.', N'20481782199', N'LA LIBERTAD', N'999888170')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (71, N'MOTORES DIESEL ANDINOS S.A. - MODASA', N'20417926632', N'LIMA', N'999888171')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (72, N'MOTORES LATINOAMERICANOS S.A.C.', N'20393292041', N'UCAYALI', N'999888172')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (73, N'MOTOS STILOS S.A.C.', N'20507099069', N'LIMA', N'999888173')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (74, N'MOTOSERVICIOS LOS OLIVOS S.R.L.', N'20295008190', N'LIMA', N'999888174')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (75, N'PLANTA INDUSTRIAL CHEMOTO S.A.C.', N'20529722304', N'LAMBAYEQUE', N'999888175')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (76, N'PROFESIONALES COSECA S.A.C.', N'20510485557', N'LIMA', N'999888176')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (77, N'PUMA MOTORS E.I.R.L.', N'20454074115', N'AREQUIPA', N'999888177')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (78, N'RAJUNSA S.A.C.', N'20522969193', N'CALLAO', N'999888178')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (79, N'REMOLQUES TRAMONTANA S.A.C.', N'20514038199', N'LIMA', N'999888179')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (80, N'TANQUES CISTERNAS AFINES E.I.R.L. - RECONCISA', N'20486064235', N'JUNIN', N'999888180')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (81, N'RISSING MOTORS S.A.C.', N'20544431022', N'LIMA', N'999888181')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (82, N'RMB SATECI S.A.C.', N'20508596732', N'LIMA', N'999888182')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (83, N'RONCO MOTORSS S.A.C.', N'20510421583', N'LIMA', N'999888183')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (84, N'ROSITA INDUSTRIAS METALICAS E.I.R.L.', N'20393056232', N'UCAYALI', N'999888184')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (85, N'ROYAL PROYECTOS Y SERVICIOS INDUSTRIALES S.A.C.', N'20504044123', N'LIMA', N'999888185')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (86, N'FABRICACIONES SE?OR DE HUANCA E.I.R.L. - SEMAFASH E.I.R.L.', N'20453885578', N'AREQUIPA', N'999888186')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (87, N'SERVICIOS INGENIERIA ELECTROMECANICA S.A.C. - SIELSAC', N'20480028971', N'LAMBAYEQUE', N'999888187')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (88, N'SGM INGENIEROS E.I.R.L.', N'20498476539', N'AREQUIPA', N'999888188')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (89, N'SHIMBA SELVA S.A.C.', N'20394031292', N'UCAYALI', N'999888189')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (90, N'TRACTO CAMIONES USA S.A.C.', N'20293774308', N'LIMA', N'999888190')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (91, N'TRANS OIL BUNKER S.A.C.', N'20515738461', N'LIMA', N'999888191')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (92, N'TRANSVISA E.I.R.L.', N'20131173734', N'LIMA PROVINCIAS', N'999888192')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (93, N'TRICAR TECNOLOGIA S.A.C.', N'20513769351', N'LIMA', N'999888193')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (94, N'VF MOTOPARTS S.R.LTDA.', N'20341019819', N'LIMA', N'999888194')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (95, N'VRAMEL CONTRATISTAS E.I.R.L.', N'20329847978', N'CALLAO', N'999888195')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (96, N'ZEUS PERU S.A.C', N'20545029406', N'LIMA', N'999888196')
GO
INSERT [dbo].[cliente] ([id], [nombre], [numruc], [direccion], [telefono]) VALUES (97, N'ZINSAC DEL PERU S.A.C.', N'20556578746', N'LIMA', N'999888197')
GO
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle] ON 
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (1, 1, 9, 20)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (2, 1, 2, 10)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (3, 1, 16, 20)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (4, 2, 13, 19)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (5, 2, 13, 19)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (6, 2, 4, 11)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (7, 3, 2, 15)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (8, 3, 5, 18)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (9, 3, 18, 18)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (10, 4, 4, 12)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (11, 4, 6, 18)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (12, 4, 10, 19)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (13, 5, 17, 18)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (14, 5, 17, 20)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (15, 5, 4, 10)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (16, 6, 13, 10)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (17, 6, 9, 16)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (18, 6, 17, 16)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (19, 7, 6, 11)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (20, 7, 3, 17)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (21, 7, 5, 16)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (22, 8, 3, 11)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (23, 8, 20, 12)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (24, 8, 11, 20)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (25, 9, 14, 20)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (26, 9, 18, 16)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (27, 9, 12, 15)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (28, 10, 19, 16)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (29, 10, 14, 17)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (30, 10, 7, 13)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (31, 19, 12, 3)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (32, 19, 1, 5)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (41, 24, 3, 2)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (42, 24, 34, 3)
GO
INSERT [dbo].[detalle] ([id], [idVenta], [idProducto], [cantidad]) VALUES (43, 24, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[detalle] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (1, N'TE DHARAMSALA', N'BEBIDAS', 18.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (2, N'CERVEZA TIBETANA BARLEY', N'BEBIDAS', 19.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (3, N'SIROPE DE REGALIZ', N'CONDIMENTOS', 10.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (4, N'ESPECIAS CAJUN DEL CHEF ANTON', N'CONDIMENTOS', 22.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (5, N'MEZCLA GUMBO DEL CHEF ANTON', N'CONDIMENTOS', 21.3500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (6, N'MERMELADA DE GROSELLAS DE LA ABUELA', N'CONDIMENTOS', 25.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (7, N'PERAS SECAS ORGANICAS DEL TIO BOB', N'FRUTAS/VERDURAS', 30.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (8, N'SALSA DE ARANDANOS NORTHWOODS', N'CONDIMENTOS', 40.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (9, N'BUEY MISHI KOBE', N'CARNES', 97.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (10, N'PEZ ESPADA', N'PESCADO/MARISCO', 31.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (11, N'QUESO CABRALES', N'LACTEOS', 21.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (12, N'QUESO MANCHEGO LA PASTORA', N'LACTEOS', 38.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (13, N'ALGAS KONBU', N'PESCADO/MARISCO', 6.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (14, N'CUAJADA DE JUDIAS', N'FRUTAS/VERDURAS', 23.2500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (15, N'SALSA DE SOJA BAJA EN SODIO', N'CONDIMENTOS', 15.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (16, N'POSTRE DE MERENGUE PAVLOVA', N'REPOSTERIA', 17.4500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (17, N'CORDERO ALICE SPRINGS', N'CARNES', 39.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (18, N'LANGOSTINOS TIGRE CARNARVON', N'PESCADO/MARISCO', 62.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (19, N'PASTAS DE TE DE CHOCOLATE', N'REPOSTERIA', 9.2000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (20, N'MERMELADA DE SIR RODNEYS', N'REPOSTERIA', 81.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (21, N'BOLLOS DE SIR RODNEYS', N'REPOSTERIA', 10.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (22, N'PAN DE CENTENO CRUJIENTE ESTILO GUSTAFS', N'GRANOS/CEREALES', 21.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (23, N'PAN FINO', N'GRANOS/CEREALES', 9.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (24, N'REFRESCO GUARANA FANTASTICA', N'BEBIDAS', 4.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (25, N'CREMA DE CHOCOLATE Y NUECES NUNUCA', N'REPOSTERIA', 14.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (26, N'OSITOS DE GOMA GUMB?R', N'REPOSTERIA', 31.2300)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (27, N'CHOCOLATE SCHOGGI', N'REPOSTERIA', 43.9000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (28, N'COL FERMENTADA R?SSLE', N'FRUTAS/VERDURAS', 45.6000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (29, N'SALCHICHA TH?RINGER', N'CARNES', 123.7900)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (30, N'ARENQUE BLANCO DEL NOROESTE', N'PESCADO/MARISCO', 25.8900)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (31, N'QUESO GORGONZOLA TELINO', N'LACTEOS', 12.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (32, N'QUESO MASCARPONE FABIOLI', N'LACTEOS', 32.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (33, N'QUESO DE CABRA', N'LACTEOS', 2.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (34, N'CERVEZA SASQUATCH', N'BEBIDAS', 14.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (35, N'CERVEZA NEGRA STEELEYE', N'BEBIDAS', 18.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (36, N'ESCABECHE DE ARENQUE', N'PESCADO/MARISCO', 19.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (37, N'SALMON AHUMADO GRAVAD', N'PESCADO/MARISCO', 26.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (38, N'VINO C?TE DE BLAYE', N'BEBIDAS', 263.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (39, N'LICOR VERDE CHARTREUSE', N'BEBIDAS', 18.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (40, N'CARNE DE CANGREJO DE BOSTON', N'PESCADO/MARISCO', 18.4000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (41, N'CREMA DE ALMEJAS ESTILO NUEVA INGLATERRA', N'PESCADO/MARISCO', 9.6500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (42, N'TALLARINES DE SINGAPUR', N'GRANOS/CEREALES', 14.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (43, N'CAFE DE MALASIA', N'BEBIDAS', 46.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (44, N'AZUCAR NEGRA MALACCA', N'CONDIMENTOS', 19.4500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (45, N'ARENQUE AHUMADO', N'PESCADO/MARISCO', 9.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (46, N'ARENQUE SALADO', N'PESCADO/MARISCO', 12.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (47, N'GALLETAS ZAANSE', N'REPOSTERIA', 9.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (48, N'CHOCOLATE HOLANDES', N'REPOSTERIA', 12.7500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (49, N'REGALIZ', N'REPOSTERIA', 20.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (50, N'CHOCOLATE BLANCO', N'REPOSTERIA', 16.2500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (51, N'MANZANAS SECAS MANJIMUP', N'FRUTAS/VERDURAS', 53.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (52, N'CEREALES PARA FILO', N'GRANOS/CEREALES', 7.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (53, N'EMPANADA DE CARNE', N'CARNES', 32.8000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (54, N'EMPANADA DE CERDO', N'CARNES', 7.4500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (55, N'PATE CHINO', N'CARNES', 24.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (56, N'GNOCCHI DE LA ABUELA ALICIA', N'GRANOS/CEREALES', 38.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (57, N'RAVIOLIS ANGELO', N'GRANOS/CEREALES', 19.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (58, N'CARACOLES DE BORGO?A', N'PESCADO/MARISCO', 13.2500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (59, N'RACLET DE QUESO COURDAVAULT', N'LACTEOS', 55.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (60, N'CAMEMBERT PIERROT', N'LACTEOS', 34.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (61, N'SIROPE DE ARCE', N'CONDIMENTOS', 28.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (62, N'TARTA DE AZUCAR', N'REPOSTERIA', 49.3000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (63, N'SANDWICH DE VEGETALES', N'CONDIMENTOS', 43.9000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (64, N'BOLLOS DE PAN DE WIMMER', N'GRANOS/CEREALES', 33.2500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (65, N'SALSA DE PIMIENTO PICANTE DE LUISIANA', N'CONDIMENTOS', 21.0500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (66, N'ESPECIAS PICANTES DE LUISIANA', N'CONDIMENTOS', 17.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (67, N'CERVEZA LAUGHING LUMBERJACK', N'BEBIDAS', 14.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (68, N'BARRAS DE PAN DE ESCOCIA', N'REPOSTERIA', 12.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (69, N'QUESO GUDBRANDSDALS', N'LACTEOS', 36.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (70, N'CERVEZA OUTBACK', N'BEBIDAS', 15.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (71, N'CREMA DE QUESO FLTEMYS', N'LACTEOS', 21.5000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (72, N'QUESO MOZZARELLA GIOVANNI', N'LACTEOS', 34.8000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (73, N'CAVIAR ROJO', N'PESCADO/MARISCO', 15.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (74, N'QUESO DE SOJA LONGLIFE', N'FRUTAS/VERDURAS', 10.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (75, N'CERVEZA KLOSTERBIER', N'BEBIDAS', 7.7500)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (76, N'LICOR CLOUDBERRY', N'BEBIDAS', 18.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (77, N'SALSA VERDE ORIGINAL FRANKFURTER', N'CONDIMENTOS', 13.0000)
GO
INSERT [dbo].[producto] ([id], [descripcion], [categoria], [precio]) VALUES (85, N'POLO TALLA X asdasd', N'ROPA', 50.0000)
GO
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[venta] ON 
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (1, CAST(N'2018-03-20T00:00:00.000' AS DateTime), 7)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (2, CAST(N'2018-03-21T00:00:00.000' AS DateTime), 10)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (3, CAST(N'2018-03-22T00:00:00.000' AS DateTime), 14)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (4, CAST(N'2018-03-23T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (5, CAST(N'2018-03-24T00:00:00.000' AS DateTime), 11)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (6, CAST(N'2018-03-25T00:00:00.000' AS DateTime), 19)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (7, CAST(N'2018-03-26T00:00:00.000' AS DateTime), 18)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (8, CAST(N'2018-03-27T00:00:00.000' AS DateTime), 6)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (9, CAST(N'2018-03-28T00:00:00.000' AS DateTime), 14)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (10, CAST(N'2018-03-29T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (11, CAST(N'2018-03-30T00:00:00.000' AS DateTime), 17)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (12, CAST(N'2018-03-31T00:00:00.000' AS DateTime), 17)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (13, CAST(N'2018-04-01T00:00:00.000' AS DateTime), 20)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (14, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 17)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (15, CAST(N'2018-04-03T00:00:00.000' AS DateTime), 11)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (16, CAST(N'2018-04-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (17, CAST(N'2018-04-05T00:00:00.000' AS DateTime), 6)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (18, CAST(N'2018-04-06T00:00:00.000' AS DateTime), 20)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (19, CAST(N'2025-04-23T19:00:47.507' AS DateTime), 5)
GO
INSERT [dbo].[venta] ([id], [fecventa], [idCliente]) VALUES (24, CAST(N'2025-05-01T14:11:18.490' AS DateTime), 12)
GO
SET IDENTITY_INSERT [dbo].[venta] OFF
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([id])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([id])
GO
