module BlueStateDigital
  class EventRSVP < ApiDataModel
    FIELDS = [:event_id_obfuscated, :will_attend, :email, :zip, :country, :firstname, :lastname, :phone, :guid]
    attr_accessor *FIELDS

    def save
      connection.perform_graph_request '/addrsvp', self.attributes, "POST"
    end

    def attributes
      FIELDS.inject({}) do |attrs, field|
        attrs[field] = self.send(field)
        attrs
      end
    end
  end
end
