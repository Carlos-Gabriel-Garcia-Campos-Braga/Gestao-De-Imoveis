﻿using SharedClasses.ValueObjects;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestaoImoveisAPI.Models
{
    public class Renter
    {
        //PK
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; } = string.Empty;

        [Required]
        [MaxLength(11)]
        public CPF CPF { get; set; }

        [Phone]
        public PhoneNumber PhoneNumber { get; set; } = null;

        //Para entendermos, um inquilino pode ter vários contratos, 1:N
        [JsonIgnore]
        public ICollection<RentalContract> Contracts { get; set; } = new List<RentalContract>();
    }
}
