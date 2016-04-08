@Shipments = new Mongo.Collection "shipments"
Shipments.allow
  insert: () -> true
  update: () -> true