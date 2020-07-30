{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module Helloworld where
import qualified Prelude as Hs
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Suite.DotProto as HsProtobuf
import qualified Proto3.Suite.JSONPB as HsJSONPB
import Proto3.Suite.JSONPB ((.=), (.:))
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Wire as HsProtobuf
import qualified Control.Applicative as Hs
import Control.Applicative ((<*>), (<|>), (<$>))
import qualified Control.DeepSeq as Hs
import qualified Control.Monad as Hs
import qualified Data.ByteString as Hs
import qualified Data.Coerce as Hs
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.List.NonEmpty as Hs (NonEmpty(..))
import qualified Data.Map as Hs (Map, mapKeysMonotonic)
import qualified Data.Proxy as Proxy
import qualified Data.String as Hs (fromString)
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Enum as Hs
import qualified GHC.Generics as Hs
import qualified Unsafe.Coerce as Hs
import Network.GRPC.HighLevel.Generated as HsGRPC
import Network.GRPC.HighLevel.Client as HsGRPC
import Network.GRPC.HighLevel.Server as HsGRPC hiding (serverLoop)
import Network.GRPC.HighLevel.Server.Unregistered as HsGRPC
       (serverLoop)

data Greeter request response = Greeter{greeterSayHello ::
                                        request 'HsGRPC.Normal Helloworld.HelloRequest
                                          Helloworld.HelloReply
                                          -> Hs.IO (response 'HsGRPC.Normal Helloworld.HelloReply)}
                              deriving Hs.Generic

greeterServer ::
                Greeter HsGRPC.ServerRequest HsGRPC.ServerResponse ->
                  HsGRPC.ServiceOptions -> Hs.IO ()
greeterServer Greeter{greeterSayHello = greeterSayHello}
  (ServiceOptions serverHost serverPort useCompression
     userAgentPrefix userAgentSuffix initialMetadata sslConfig logger)
  = (HsGRPC.serverLoop
       HsGRPC.defaultOptions{HsGRPC.optNormalHandlers =
                               [(HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName "/helloworld.Greeter/SayHello")
                                   (HsGRPC.convertGeneratedServerHandler greeterSayHello))],
                             HsGRPC.optClientStreamHandlers = [],
                             HsGRPC.optServerStreamHandlers = [],
                             HsGRPC.optBiDiStreamHandlers = [], optServerHost = serverHost,
                             optServerPort = serverPort, optUseCompression = useCompression,
                             optUserAgentPrefix = userAgentPrefix,
                             optUserAgentSuffix = userAgentSuffix,
                             optInitialMetadata = initialMetadata, optSSLConfig = sslConfig,
                             optLogger = logger})

greeterClient ::
                HsGRPC.Client ->
                  Hs.IO (Greeter HsGRPC.ClientRequest HsGRPC.ClientResult)
greeterClient client
  = (Hs.pure Greeter) <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName "/helloworld.Greeter/SayHello")))

newtype HelloRequest = HelloRequest{helloRequestName :: Hs.Text}
                       deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named HelloRequest where
        nameOf _ = (Hs.fromString "HelloRequest")

instance HsProtobuf.HasDefault HelloRequest

instance HsProtobuf.Message HelloRequest where
        encodeMessage _ HelloRequest{helloRequestName = helloRequestName}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   helloRequestName)])
        decodeMessage _
          = (Hs.pure HelloRequest) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "name")
                []
                "")]

instance HsJSONPB.ToJSONPB HelloRequest where
        toJSONPB (HelloRequest f1) = (HsJSONPB.object ["name" .= f1])
        toEncodingPB (HelloRequest f1) = (HsJSONPB.pairs ["name" .= f1])

instance HsJSONPB.FromJSONPB HelloRequest where
        parseJSONPB
          = (HsJSONPB.withObject "HelloRequest"
               (\ obj -> (Hs.pure HelloRequest) <*> obj .: "name"))

instance HsJSONPB.ToJSON HelloRequest where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON HelloRequest where
        parseJSON = HsJSONPB.parseJSONPB

instance HsJSONPB.ToSchema HelloRequest where
        declareNamedSchema _
          = do let declare_name = HsJSONPB.declareSchemaRef
               helloRequestName <- declare_name Proxy.Proxy
               let _ = Hs.pure HelloRequest <*> HsJSONPB.asProxy declare_name
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "HelloRequest",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("name", helloRequestName)]}})

newtype HelloReply = HelloReply{helloReplyMessage :: Hs.Text}
                     deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named HelloReply where
        nameOf _ = (Hs.fromString "HelloReply")

instance HsProtobuf.HasDefault HelloReply

instance HsProtobuf.Message HelloReply where
        encodeMessage _ HelloReply{helloReplyMessage = helloReplyMessage}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   helloReplyMessage)])
        decodeMessage _
          = (Hs.pure HelloReply) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "message")
                []
                "")]

instance HsJSONPB.ToJSONPB HelloReply where
        toJSONPB (HelloReply f1) = (HsJSONPB.object ["message" .= f1])
        toEncodingPB (HelloReply f1) = (HsJSONPB.pairs ["message" .= f1])

instance HsJSONPB.FromJSONPB HelloReply where
        parseJSONPB
          = (HsJSONPB.withObject "HelloReply"
               (\ obj -> (Hs.pure HelloReply) <*> obj .: "message"))

instance HsJSONPB.ToJSON HelloReply where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON HelloReply where
        parseJSON = HsJSONPB.parseJSONPB

instance HsJSONPB.ToSchema HelloReply where
        declareNamedSchema _
          = do let declare_message = HsJSONPB.declareSchemaRef
               helloReplyMessage <- declare_message Proxy.Proxy
               let _ = Hs.pure HelloReply <*> HsJSONPB.asProxy declare_message
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "HelloReply",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("message", helloReplyMessage)]}})