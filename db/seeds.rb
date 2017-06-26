if Rails.env.development?
  Court.create [
    {
      name: "Baskquete ICV",
      address: "Rua Maricá, 320, Praça Seca, Rio de Janeiro," \
      "State of Rio de Janeiro, Brazil",
      coordinates: { latitude: -22.8903048, longitude: -43.345593399999984 },
      recurrent_events: [
        {
          recurrence: {
            every: :week,
            on: :tuesday,
            at: "06:30 PM -0300"
          },
          duration: 2.hours
        },
        {
          recurrence: {
            every: :month,
            day: { thursday: 3 },
            at: "06:30 PM -0300"
          },
          duration: 2.hours
        }
      ]
    },
    {
      name: "Basquete IBB",
      address: "Igreja Batista Betânia Tabernáculo de Adoração," \
      "Estrada Manuel Nogueira de Sá, Realengo, Rio de Janeiro," \
      "State of Rio de Janeiro, Brazil",
      coordinates: { latitude: -22.8885352, longitude: -43.41397269999999 }
    },
    {
      name: "Baskeire",
      address: "Rua Cairuçu, Vila Valqueire, Rio de Janeiro," \
      "State of Rio de Janeiro, Brazil",
      coordinates: { latitude: -22.8810174, longitude: -43.37163129999999 }
    },
    {
      name: "Praça Patriarca",
      address: "Rua Andrade Pinto, Madureira, Rio de Janeiro," \
      "State of Rio de Janeiro, Brazil",
      coordinates: { latitude: -22.8774477, longitude: -43.34235460000002 }
    }
  ]
end
