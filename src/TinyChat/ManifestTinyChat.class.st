"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTinyChat,
	#superclass : #PackageManifest,
	#category : #'TinyChat-Manifest'
}

{ #category : #'code-critics' }
ManifestTinyChat class >> ruleGRAnsiStringsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#TCMessage #printOn: #false)) #'2020-10-26T23:56:02.900154+08:00') )
]
