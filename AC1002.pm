# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package CAD::Format::DWG::AC1002;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COORDINATES_ABSOLUTE_COORDINATES = 0;
our $COORDINATES_ABSOLUTE_COORDINATES_REALTIME = 1;
our $COORDINATES_RELATIVE_POLAR_COORDINATES = 2;

our $ENTITIES_LINE = 1;
our $ENTITIES_POINT = 2;
our $ENTITIES_CIRCLE = 3;
our $ENTITIES_SHAPE = 4;
our $ENTITIES_TEXT = 7;
our $ENTITIES_ARC = 8;
our $ENTITIES_TRACE = 9;
our $ENTITIES_SOLID = 11;
our $ENTITIES_BLOCK_BEGIN = 12;
our $ENTITIES_BLOCK_END = 13;
our $ENTITIES_INSERT = 14;
our $ENTITIES_ATTDEF = 15;
our $ENTITIES_ATTRIB = 16;
our $ENTITIES_SEQEND = 17;
our $ENTITIES_POLYLINE = 18;
our $ENTITIES_POLYLINE2 = 19;
our $ENTITIES_VERTEX = 20;
our $ENTITIES_LINE3D = 21;
our $ENTITIES_FACE3D = 22;
our $ENTITIES_DIM = 23;

our $ISO_PLANE_LEFT = 0;
our $ISO_PLANE_TOP = 1;
our $ISO_PLANE_RIGHT = 2;

our $TEXT_TYPE_CENTER = 1;
our $TEXT_TYPE_END = 2;
our $TEXT_TYPE_ALIGNED = 3;

our $ATTRIBUTES_FALSE = 0;
our $ATTRIBUTES_NORMAL = 1;
our $ATTRIBUTES_TRUE = 2;

our $ANGLE_DIRECTION_COUNTERCLOCKWISE = 0;
our $ANGLE_DIRECTION_CLOCKWISE = 1;

our $CURRENT_COLOR_BYBLOCK = 0;
our $CURRENT_COLOR_RED = 1;
our $CURRENT_COLOR_YELLOW = 2;
our $CURRENT_COLOR_GREEN = 3;
our $CURRENT_COLOR_CYAN = 4;
our $CURRENT_COLOR_BLUE = 5;
our $CURRENT_COLOR_MAGENTA = 6;
our $CURRENT_COLOR_WHITE = 7;
our $CURRENT_COLOR_BYLAYER = 256;

our $UNIT_TYPES_SCIENTIFIC = 1;
our $UNIT_TYPES_DECIMAL = 2;
our $UNIT_TYPES_ENGINEERING = 3;
our $UNIT_TYPES_ARCHITECTURAL = 4;
our $UNIT_TYPES_FRACTIONAL = 5;

our $UNITS_FOR_ANGLES_DECIMAL_DEGREES = 0;
our $UNITS_FOR_ANGLES_DEGREES_MINUTES_SECONDS = 1;
our $UNITS_FOR_ANGLES_GRADIANS = 2;
our $UNITS_FOR_ANGLES_RADIANS = 3;
our $UNITS_FOR_ANGLES_SURVEYOR_S_UNITS = 4;

our $LIMITS_CHECK_OBJECTS_CAN_OUTSIDE_GRID = 0;
our $LIMITS_CHECK_OBJECTS_CANNOT_OUTSIDE_GRID = 1;

our $OSNAP_MODES_NONE = 0;
our $OSNAP_MODES_ENDPOINT = 1;
our $OSNAP_MODES_MIDPOINT = 2;
our $OSNAP_MODES_CENTER = 4;
our $OSNAP_MODES_NODE = 8;
our $OSNAP_MODES_QUADRANT = 16;
our $OSNAP_MODES_INTERSECTION = 32;
our $OSNAP_MODES_INSERTION = 64;
our $OSNAP_MODES_PERPENDICULAR = 128;
our $OSNAP_MODES_TANGENT = 256;
our $OSNAP_MODES_NEAREST = 512;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = CAD::Format::DWG::AC1002::Header->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_entities} = $self->{_io}->read_bytes(($self->header()->entities_end() - $self->header()->entities_start()));
    my $io__raw_entities = IO::KaitaiStruct::Stream->new($self->{_raw_entities});
    $self->{entities} = CAD::Format::DWG::AC1002::RealEntities->new($io__raw_entities, $self, $self->{_root});
    $self->{blocks} = ();
    my $n_blocks = $self->header()->table_block()->items();
    for (my $i = 0; $i < $n_blocks; $i++) {
        $self->{blocks}[$i] = CAD::Format::DWG::AC1002::Block->new($self->{_io}, $self, $self->{_root});
    }
    $self->{layers} = ();
    my $n_layers = $self->header()->table_layer()->items();
    for (my $i = 0; $i < $n_layers; $i++) {
        $self->{layers}[$i] = CAD::Format::DWG::AC1002::Layer->new($self->{_io}, $self, $self->{_root});
    }
    $self->{styles} = ();
    my $n_styles = $self->header()->table_style()->items();
    for (my $i = 0; $i < $n_styles; $i++) {
        $self->{styles}[$i] = CAD::Format::DWG::AC1002::Style->new($self->{_io}, $self, $self->{_root});
    }
    $self->{linetypes} = ();
    my $n_linetypes = $self->header()->table_linetype()->items();
    for (my $i = 0; $i < $n_linetypes; $i++) {
        $self->{linetypes}[$i] = CAD::Format::DWG::AC1002::Linetype->new($self->{_io}, $self, $self->{_root});
    }
    $self->{views} = ();
    my $n_views = $self->header()->table_view()->items();
    for (my $i = 0; $i < $n_views; $i++) {
        $self->{views}[$i] = CAD::Format::DWG::AC1002::View->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_raw_block_entities} = $self->{_io}->read_bytes($self->header()->blocks_size());
    my $io__raw_block_entities = IO::KaitaiStruct::Stream->new($self->{_raw_block_entities});
    $self->{block_entities} = CAD::Format::DWG::AC1002::RealEntities->new($io__raw_block_entities, $self, $self->{_root});
    if (!($self->_io()->is_eof())) {
        $self->{todo} = ();
        while (!$self->{_io}->is_eof()) {
            push @{$self->{todo}}, $self->{_io}->read_bytes_full();
        }
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub entities {
    my ($self) = @_;
    return $self->{entities};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

sub layers {
    my ($self) = @_;
    return $self->{layers};
}

sub styles {
    my ($self) = @_;
    return $self->{styles};
}

sub linetypes {
    my ($self) = @_;
    return $self->{linetypes};
}

sub views {
    my ($self) = @_;
    return $self->{views};
}

sub block_entities {
    my ($self) = @_;
    return $self->{block_entities};
}

sub todo {
    my ($self) = @_;
    return $self->{todo};
}

sub _raw_entities {
    my ($self) = @_;
    return $self->{_raw_entities};
}

sub _raw_block_entities {
    my ($self) = @_;
    return $self->{_raw_block_entities};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityAttrib;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{u1} = $self->{_io}->read_f8le();
    $self->{u2} = $self->{_io}->read_f8le();
    $self->{u3} = $self->{_io}->read_f8le();
    $self->{size} = $self->{_io}->read_s2le();
    $self->{text} = $self->{_io}->read_bytes($self->size());
    $self->{size2} = $self->{_io}->read_s2le();
    $self->{text2} = $self->{_io}->read_bytes($self->size2());
    $self->{u4} = $self->{_io}->read_u1();
    if ($self->entity_common()->flag2_7()) {
        $self->{u5} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{u6} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{u7} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{aligned_to} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

sub u2 {
    my ($self) = @_;
    return $self->{u2};
}

sub u3 {
    my ($self) = @_;
    return $self->{u3};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

sub size2 {
    my ($self) = @_;
    return $self->{size2};
}

sub text2 {
    my ($self) = @_;
    return $self->{text2};
}

sub u4 {
    my ($self) = @_;
    return $self->{u4};
}

sub u5 {
    my ($self) = @_;
    return $self->{u5};
}

sub u6 {
    my ($self) = @_;
    return $self->{u6};
}

sub u7 {
    my ($self) = @_;
    return $self->{u7};
}

sub aligned_to {
    my ($self) = @_;
    return $self->{aligned_to};
}

########################################################################
package CAD::Format::DWG::AC1002::LinetypeFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{frozen} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub frozen {
    my ($self) = @_;
    return $self->{frozen};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityTmp;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1002::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{xxx} = $self->{_io}->read_bytes(($self->entity_size() - 4));
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub xxx {
    my ($self) = @_;
    return $self->{xxx};
}

########################################################################
package CAD::Format::DWG::AC1002::BlockFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityLine3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x1} = $self->{_io}->read_f8le();
    $self->{y1} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{z1} = $self->{_io}->read_f8le();
    }
    $self->{x2} = $self->{_io}->read_f8le();
    $self->{y2} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_7()) {
        $self->{z2} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x1 {
    my ($self) = @_;
    return $self->{x1};
}

sub y1 {
    my ($self) = @_;
    return $self->{y1};
}

sub z1 {
    my ($self) = @_;
    return $self->{z1};
}

sub x2 {
    my ($self) = @_;
    return $self->{x2};
}

sub y2 {
    my ($self) = @_;
    return $self->{y2};
}

sub z2 {
    my ($self) = @_;
    return $self->{z2};
}

########################################################################
package CAD::Format::DWG::AC1002::Pattern;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{pattern1} = $self->{_io}->read_f8le();
    $self->{pattern2} = $self->{_io}->read_f8le();
    $self->{pattern3} = $self->{_io}->read_f8le();
    $self->{pattern4} = $self->{_io}->read_f8le();
    $self->{pattern5} = $self->{_io}->read_f8le();
    $self->{pattern6} = $self->{_io}->read_f8le();
    $self->{pattern7} = $self->{_io}->read_f8le();
    $self->{pattern8} = $self->{_io}->read_f8le();
    $self->{pattern9} = $self->{_io}->read_f8le();
    $self->{pattern10} = $self->{_io}->read_f8le();
    $self->{pattern11} = $self->{_io}->read_f8le();
    $self->{pattern12} = $self->{_io}->read_f8le();
}

sub pattern1 {
    my ($self) = @_;
    return $self->{pattern1};
}

sub pattern2 {
    my ($self) = @_;
    return $self->{pattern2};
}

sub pattern3 {
    my ($self) = @_;
    return $self->{pattern3};
}

sub pattern4 {
    my ($self) = @_;
    return $self->{pattern4};
}

sub pattern5 {
    my ($self) = @_;
    return $self->{pattern5};
}

sub pattern6 {
    my ($self) = @_;
    return $self->{pattern6};
}

sub pattern7 {
    my ($self) = @_;
    return $self->{pattern7};
}

sub pattern8 {
    my ($self) = @_;
    return $self->{pattern8};
}

sub pattern9 {
    my ($self) = @_;
    return $self->{pattern9};
}

sub pattern10 {
    my ($self) = @_;
    return $self->{pattern10};
}

sub pattern11 {
    my ($self) = @_;
    return $self->{pattern11};
}

sub pattern12 {
    my ($self) = @_;
    return $self->{pattern12};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityFace3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

########################################################################
package CAD::Format::DWG::AC1002::EntitySolid;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{from} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{from_and} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to_and} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub from {
    my ($self) = @_;
    return $self->{from};
}

sub from_and {
    my ($self) = @_;
    return $self->{from_and};
}

sub to {
    my ($self) = @_;
    return $self->{to};
}

sub to_and {
    my ($self) = @_;
    return $self->{to_and};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityInsert;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{block_index} = $self->{_io}->read_s2le();
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{x_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{y_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{rotation_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{z_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{columns} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{rows} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{column_spacing} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{row_spacing} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub block_index {
    my ($self) = @_;
    return $self->{block_index};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub x_scale {
    my ($self) = @_;
    return $self->{x_scale};
}

sub y_scale {
    my ($self) = @_;
    return $self->{y_scale};
}

sub rotation_angle_in_radians {
    my ($self) = @_;
    return $self->{rotation_angle_in_radians};
}

sub z_scale {
    my ($self) = @_;
    return $self->{z_scale};
}

sub columns {
    my ($self) = @_;
    return $self->{columns};
}

sub rows {
    my ($self) = @_;
    return $self->{rows};
}

sub column_spacing {
    my ($self) = @_;
    return $self->{column_spacing};
}

sub row_spacing {
    my ($self) = @_;
    return $self->{row_spacing};
}

########################################################################
package CAD::Format::DWG::AC1002::Style;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1002::StyleFlag->new($self->{_io}, $self, $self->{_root});
    $self->{style_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{height} = $self->{_io}->read_f8le();
    $self->{width_factor} = $self->{_io}->read_f8le();
    $self->{obliquing_angle_in_radians} = $self->{_io}->read_f8le();
    $self->{generation} = CAD::Format::DWG::AC1002::GenerationFlags->new($self->{_io}, $self, $self->{_root});
    $self->{last_height} = $self->{_io}->read_f8le();
    $self->{font_file} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
    $self->{bigfont_file} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub style_name {
    my ($self) = @_;
    return $self->{style_name};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub width_factor {
    my ($self) = @_;
    return $self->{width_factor};
}

sub obliquing_angle_in_radians {
    my ($self) = @_;
    return $self->{obliquing_angle_in_radians};
}

sub generation {
    my ($self) = @_;
    return $self->{generation};
}

sub last_height {
    my ($self) = @_;
    return $self->{last_height};
}

sub font_file {
    my ($self) = @_;
    return $self->{font_file};
}

sub bigfont_file {
    my ($self) = @_;
    return $self->{bigfont_file};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityCommon;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1002::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s1();
    $self->{flag1} = $self->{_io}->read_s1();
    $self->{flag2_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_8} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_8} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    if ($self->entity_mode()->entity_color_flag()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->entity_linetype_flag()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->entity_elevation_flag()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->entity_thickness_flag()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2_1 {
    my ($self) = @_;
    return $self->{flag2_1};
}

sub flag2_2 {
    my ($self) = @_;
    return $self->{flag2_2};
}

sub flag2_3 {
    my ($self) = @_;
    return $self->{flag2_3};
}

sub flag2_4 {
    my ($self) = @_;
    return $self->{flag2_4};
}

sub flag2_5 {
    my ($self) = @_;
    return $self->{flag2_5};
}

sub flag2_6 {
    my ($self) = @_;
    return $self->{flag2_6};
}

sub flag2_7 {
    my ($self) = @_;
    return $self->{flag2_7};
}

sub flag2_8 {
    my ($self) = @_;
    return $self->{flag2_8};
}

sub flag3_1 {
    my ($self) = @_;
    return $self->{flag3_1};
}

sub flag3_2 {
    my ($self) = @_;
    return $self->{flag3_2};
}

sub flag3_3 {
    my ($self) = @_;
    return $self->{flag3_3};
}

sub flag3_4 {
    my ($self) = @_;
    return $self->{flag3_4};
}

sub flag3_5 {
    my ($self) = @_;
    return $self->{flag3_5};
}

sub flag3_6 {
    my ($self) = @_;
    return $self->{flag3_6};
}

sub flag3_7 {
    my ($self) = @_;
    return $self->{flag3_7};
}

sub flag3_8 {
    my ($self) = @_;
    return $self->{flag3_8};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

########################################################################
package CAD::Format::DWG::AC1002::Linetype;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1002::LinetypeFlag->new($self->{_io}, $self, $self->{_root});
    $self->{linetype_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{description} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(48), 0, 0));
    $self->{alignment} = $self->{_io}->read_u1();
    $self->{num_dashes} = $self->{_io}->read_u1();
    $self->{pattern_len} = $self->{_io}->read_f8le();
    $self->{pattern} = CAD::Format::DWG::AC1002::Pattern->new($self->{_io}, $self, $self->{_root});
    $self->{u21} = $self->{_io}->read_s1();
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub linetype_name {
    my ($self) = @_;
    return $self->{linetype_name};
}

sub description {
    my ($self) = @_;
    return $self->{description};
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment};
}

sub num_dashes {
    my ($self) = @_;
    return $self->{num_dashes};
}

sub pattern_len {
    my ($self) = @_;
    return $self->{pattern_len};
}

sub pattern {
    my ($self) = @_;
    return $self->{pattern};
}

sub u21 {
    my ($self) = @_;
    return $self->{u21};
}

########################################################################
package CAD::Format::DWG::AC1002::StyleFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{vertical} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{load} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub vertical {
    my ($self) = @_;
    return $self->{vertical};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub load {
    my ($self) = @_;
    return $self->{load};
}

########################################################################
package CAD::Format::DWG::AC1002::Point3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{z} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityBlockEnd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

########################################################################
package CAD::Format::DWG::AC1002::UnknownRepeating;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{unknown_repeating1} = $self->{_io}->read_f8le();
    $self->{unknown_repeating2} = $self->{_io}->read_f8le();
    $self->{unknown_repeating3} = $self->{_io}->read_f8le();
    $self->{unknown_repeating4} = $self->{_io}->read_f8le();
    $self->{unknown_repeating5} = $self->{_io}->read_f8le();
    $self->{unknown_repeating6} = $self->{_io}->read_f8le();
    $self->{unknown_repeating7} = $self->{_io}->read_f8le();
    $self->{unknown_repeating8} = $self->{_io}->read_f8le();
    $self->{unknown_repeating9} = $self->{_io}->read_f8le();
    $self->{unknown_repeating10} = $self->{_io}->read_f8le();
    $self->{unknown_repeating11} = $self->{_io}->read_f8le();
    $self->{unknown_repeating12} = $self->{_io}->read_f8le();
    $self->{unknown_repeating13} = $self->{_io}->read_f8le();
    $self->{unknown_repeating14} = $self->{_io}->read_f8le();
    $self->{unknown_repeating15} = $self->{_io}->read_f8le();
    $self->{unknown_repeating16} = $self->{_io}->read_f8le();
    $self->{unknown_repeating17} = $self->{_io}->read_f8le();
    $self->{unknown_repeating18} = $self->{_io}->read_f8le();
}

sub unknown_repeating1 {
    my ($self) = @_;
    return $self->{unknown_repeating1};
}

sub unknown_repeating2 {
    my ($self) = @_;
    return $self->{unknown_repeating2};
}

sub unknown_repeating3 {
    my ($self) = @_;
    return $self->{unknown_repeating3};
}

sub unknown_repeating4 {
    my ($self) = @_;
    return $self->{unknown_repeating4};
}

sub unknown_repeating5 {
    my ($self) = @_;
    return $self->{unknown_repeating5};
}

sub unknown_repeating6 {
    my ($self) = @_;
    return $self->{unknown_repeating6};
}

sub unknown_repeating7 {
    my ($self) = @_;
    return $self->{unknown_repeating7};
}

sub unknown_repeating8 {
    my ($self) = @_;
    return $self->{unknown_repeating8};
}

sub unknown_repeating9 {
    my ($self) = @_;
    return $self->{unknown_repeating9};
}

sub unknown_repeating10 {
    my ($self) = @_;
    return $self->{unknown_repeating10};
}

sub unknown_repeating11 {
    my ($self) = @_;
    return $self->{unknown_repeating11};
}

sub unknown_repeating12 {
    my ($self) = @_;
    return $self->{unknown_repeating12};
}

sub unknown_repeating13 {
    my ($self) = @_;
    return $self->{unknown_repeating13};
}

sub unknown_repeating14 {
    my ($self) = @_;
    return $self->{unknown_repeating14};
}

sub unknown_repeating15 {
    my ($self) = @_;
    return $self->{unknown_repeating15};
}

sub unknown_repeating16 {
    my ($self) = @_;
    return $self->{unknown_repeating16};
}

sub unknown_repeating17 {
    my ($self) = @_;
    return $self->{unknown_repeating17};
}

sub unknown_repeating18 {
    my ($self) = @_;
    return $self->{unknown_repeating18};
}

########################################################################
package CAD::Format::DWG::AC1002::Point2d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityPoint;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC1002::AttdefFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_5} = $self->{_io}->read_bits_int_be(1);
    $self->{invisible} = $self->{_io}->read_bits_int_be(1);
    $self->{constant} = $self->{_io}->read_bits_int_be(1);
    $self->{verify} = $self->{_io}->read_bits_int_be(1);
}

sub flag_1 {
    my ($self) = @_;
    return $self->{flag_1};
}

sub flag_2 {
    my ($self) = @_;
    return $self->{flag_2};
}

sub flag_3 {
    my ($self) = @_;
    return $self->{flag_3};
}

sub flag_4 {
    my ($self) = @_;
    return $self->{flag_4};
}

sub flag_5 {
    my ($self) = @_;
    return $self->{flag_5};
}

sub invisible {
    my ($self) = @_;
    return $self->{invisible};
}

sub constant {
    my ($self) = @_;
    return $self->{constant};
}

sub verify {
    my ($self) = @_;
    return $self->{verify};
}

########################################################################
package CAD::Format::DWG::AC1002::ViewFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityTrace;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{from} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{from_and} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to_and} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub from {
    my ($self) = @_;
    return $self->{from};
}

sub from_and {
    my ($self) = @_;
    return $self->{from_and};
}

sub to {
    my ($self) = @_;
    return $self->{to};
}

sub to_and {
    my ($self) = @_;
    return $self->{to_and};
}

########################################################################
package CAD::Format::DWG::AC1002::Layer;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1002::LayerFlag->new($self->{_io}, $self, $self->{_root});
    $self->{layer_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{color} = $self->{_io}->read_s2le();
    $self->{linetype_index} = $self->{_io}->read_u2le();
    $self->{u1} = $self->{_io}->read_s1();
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub layer_name {
    my ($self) = @_;
    return $self->{layer_name};
}

sub color {
    my ($self) = @_;
    return $self->{color};
}

sub linetype_index {
    my ($self) = @_;
    return $self->{linetype_index};
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

########################################################################
package CAD::Format::DWG::AC1002::AttdefFlags2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_5} = $self->{_io}->read_bits_int_be(1);
    $self->{middle} = $self->{_io}->read_bits_int_be(1);
    $self->{right} = $self->{_io}->read_bits_int_be(1);
    $self->{center} = $self->{_io}->read_bits_int_be(1);
}

sub flag_1 {
    my ($self) = @_;
    return $self->{flag_1};
}

sub flag_2 {
    my ($self) = @_;
    return $self->{flag_2};
}

sub flag_3 {
    my ($self) = @_;
    return $self->{flag_3};
}

sub flag_4 {
    my ($self) = @_;
    return $self->{flag_4};
}

sub flag_5 {
    my ($self) = @_;
    return $self->{flag_5};
}

sub middle {
    my ($self) = @_;
    return $self->{middle};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

sub center {
    my ($self) = @_;
    return $self->{center};
}

########################################################################
package CAD::Format::DWG::AC1002::Block;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1002::BlockFlag->new($self->{_io}, $self, $self->{_root});
    $self->{block_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{u2} = $self->{_io}->read_s1();
    $self->{u3} = $self->{_io}->read_s1();
    $self->{u4} = $self->{_io}->read_s1();
    $self->{u5} = $self->{_io}->read_s1();
    $self->{u6} = $self->{_io}->read_s1();
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub block_name {
    my ($self) = @_;
    return $self->{block_name};
}

sub u2 {
    my ($self) = @_;
    return $self->{u2};
}

sub u3 {
    my ($self) = @_;
    return $self->{u3};
}

sub u4 {
    my ($self) = @_;
    return $self->{u4};
}

sub u5 {
    my ($self) = @_;
    return $self->{u5};
}

sub u6 {
    my ($self) = @_;
    return $self->{u6};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityText;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{size} = $self->{_io}->read_s2le();
    $self->{value} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->size()), 0, 0));
    if ($self->entity_common()->flag2_8()) {
        $self->{angle} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{width_factor} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{obliquing_angle} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{style_index} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{generation} = CAD::Format::DWG::AC1002::GenerationFlags->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{type} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{aligned_to} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub angle {
    my ($self) = @_;
    return $self->{angle};
}

sub width_factor {
    my ($self) = @_;
    return $self->{width_factor};
}

sub obliquing_angle {
    my ($self) = @_;
    return $self->{obliquing_angle};
}

sub style_index {
    my ($self) = @_;
    return $self->{style_index};
}

sub generation {
    my ($self) = @_;
    return $self->{generation};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub aligned_to {
    my ($self) = @_;
    return $self->{aligned_to};
}

########################################################################
package CAD::Format::DWG::AC1002::GenerationFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{upside_down} = $self->{_io}->read_bits_int_be(1);
    $self->{backwards} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub upside_down {
    my ($self) = @_;
    return $self->{upside_down};
}

sub backwards {
    my ($self) = @_;
    return $self->{backwards};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityAttdef;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{start_point} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{height} = $self->{_io}->read_f8le();
    $self->{default_size} = $self->{_io}->read_s2le();
    $self->{default} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->default_size()), 0, 0));
    $self->{prompt_size} = $self->{_io}->read_s2le();
    $self->{prompt} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->prompt_size()), 0, 0));
    $self->{tag_size} = $self->{_io}->read_s2le();
    $self->{tag} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->tag_size()), 0, 0));
    $self->{flags} = CAD::Format::DWG::AC1002::AttdefFlags->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_7()) {
        $self->{rotation_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{width_scale_factor} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{unknown_index} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{flags2} = CAD::Format::DWG::AC1002::AttdefFlags2->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{end_point} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub start_point {
    my ($self) = @_;
    return $self->{start_point};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub default_size {
    my ($self) = @_;
    return $self->{default_size};
}

sub default {
    my ($self) = @_;
    return $self->{default};
}

sub prompt_size {
    my ($self) = @_;
    return $self->{prompt_size};
}

sub prompt {
    my ($self) = @_;
    return $self->{prompt};
}

sub tag_size {
    my ($self) = @_;
    return $self->{tag_size};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub rotation_angle_in_radians {
    my ($self) = @_;
    return $self->{rotation_angle_in_radians};
}

sub width_scale_factor {
    my ($self) = @_;
    return $self->{width_scale_factor};
}

sub unknown_index {
    my ($self) = @_;
    return $self->{unknown_index};
}

sub flags2 {
    my ($self) = @_;
    return $self->{flags2};
}

sub end_point {
    my ($self) = @_;
    return $self->{end_point};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityBlockBegin;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityDim;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{block_index} = $self->{_io}->read_s2le();
    $self->{dimension_line_defining_point} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{default_text_position} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_7()) {
        $self->{unknown1} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{text_size} = $self->{_io}->read_s2le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{text} = $self->{_io}->read_bytes($self->text_size());
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{extension_defining_point1} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{extension_defining_point2} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{defining_point} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{dimension_line_arc_definition_point} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag3_8()) {
        $self->{rotation_in_radians} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub block_index {
    my ($self) = @_;
    return $self->{block_index};
}

sub dimension_line_defining_point {
    my ($self) = @_;
    return $self->{dimension_line_defining_point};
}

sub default_text_position {
    my ($self) = @_;
    return $self->{default_text_position};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub text_size {
    my ($self) = @_;
    return $self->{text_size};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

sub extension_defining_point1 {
    my ($self) = @_;
    return $self->{extension_defining_point1};
}

sub extension_defining_point2 {
    my ($self) = @_;
    return $self->{extension_defining_point2};
}

sub defining_point {
    my ($self) = @_;
    return $self->{defining_point};
}

sub dimension_line_arc_definition_point {
    my ($self) = @_;
    return $self->{dimension_line_arc_definition_point};
}

sub rotation_in_radians {
    my ($self) = @_;
    return $self->{rotation_in_radians};
}

########################################################################
package CAD::Format::DWG::AC1002::HeaderVariables;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{insertion_base} = CAD::Format::DWG::AC1002::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{num_entities} = $self->{_io}->read_u2le();
    $self->{drawing_first} = CAD::Format::DWG::AC1002::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{drawing_second} = CAD::Format::DWG::AC1002::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{limits_min} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{limits_max} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{view_ctrl} = CAD::Format::DWG::AC1002::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_size} = $self->{_io}->read_f8le();
    $self->{snap} = $self->{_io}->read_s2le();
    $self->{snap_resolution} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{snap_base} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{snap_angle} = $self->{_io}->read_f8le();
    $self->{snap_style} = $self->{_io}->read_s2le();
    $self->{snap_iso_pair} = $self->{_io}->read_s2le();
    $self->{grid} = $self->{_io}->read_s2le();
    $self->{grid_unit} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{ortho} = $self->{_io}->read_s2le();
    $self->{regen} = $self->{_io}->read_s2le();
    $self->{fill} = $self->{_io}->read_s2le();
    $self->{qtext} = $self->{_io}->read_s2le();
    $self->{drag} = $self->{_io}->read_s2le();
    $self->{linetype_scale} = $self->{_io}->read_f8le();
    $self->{text_size} = $self->{_io}->read_f8le();
    $self->{trace_width} = $self->{_io}->read_f8le();
    $self->{current_layer_index} = $self->{_io}->read_s2le();
    $self->{current_color_convert} = $self->{_io}->read_s2le();
    $self->{unknown6} = $self->{_io}->read_f8le();
    $self->{unknown7a} = $self->{_io}->read_s2le();
    $self->{unknown7b} = $self->{_io}->read_s2le();
    $self->{unknown7c} = $self->{_io}->read_s2le();
    $self->{unknown8} = $self->{_io}->read_f8le();
    $self->{linear_units_format} = $self->{_io}->read_s2le();
    $self->{linear_units_precision} = $self->{_io}->read_s2le();
    $self->{axis} = $self->{_io}->read_s2le();
    $self->{axis_value} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{sketch_increment} = $self->{_io}->read_f8le();
    $self->{fillet_radius} = $self->{_io}->read_f8le();
    $self->{units_for_angles} = $self->{_io}->read_s2le();
    $self->{angular_precision} = $self->{_io}->read_s2le();
    $self->{text_style_index} = $self->{_io}->read_s2le();
    $self->{osnap} = $self->{_io}->read_s2le();
    $self->{attributes} = $self->{_io}->read_s2le();
    $self->{menu} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(15), 0, 0));
    $self->{dim_scale} = $self->{_io}->read_f8le();
    $self->{dim_arrowhead_size} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_offset} = $self->{_io}->read_f8le();
    $self->{dim_baseline_spacing} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_extend} = $self->{_io}->read_f8le();
    $self->{dim_maximum_tolerance_limit} = $self->{_io}->read_f8le();
    $self->{dim_minimum_tolerance_limit} = $self->{_io}->read_f8le();
    $self->{dim_text_height} = $self->{_io}->read_f8le();
    $self->{dim_center_mark_control} = $self->{_io}->read_f8le();
    $self->{dim_oblique_stroke_size} = $self->{_io}->read_f8le();
    $self->{dim_tolerances} = $self->{_io}->read_s1();
    $self->{dim_limits_default_text} = $self->{_io}->read_s1();
    $self->{dim_text_ext_inside_line_position} = $self->{_io}->read_s1();
    $self->{dim_text_ext_outside_line_position} = $self->{_io}->read_s1();
    $self->{dim_extension_line_first_suppress} = $self->{_io}->read_s1();
    $self->{dim_extension_line_second_suppress} = $self->{_io}->read_s1();
    $self->{dim_text_vertical_position} = $self->{_io}->read_s1();
    $self->{limits_check} = $self->{_io}->read_s2le();
    $self->{unknown10a} = $self->{_io}->read_u1();
    $self->{unknown10b} = $self->{_io}->read_u1();
    $self->{unknown10c} = $self->{_io}->read_u1();
    $self->{unknown10d} = $self->{_io}->read_u1();
    $self->{unknown10e} = $self->{_io}->read_u1();
    $self->{unknown10f} = $self->{_io}->read_u1();
    $self->{unknown10g} = $self->{_io}->read_f8le();
    $self->{unknown10h} = $self->{_io}->read_u1();
    $self->{unknown10i} = $self->{_io}->read_u1();
    $self->{unknown10j} = $self->{_io}->read_u1();
    $self->{unknown10k} = $self->{_io}->read_u1();
    $self->{unknown10l} = $self->{_io}->read_u1();
    $self->{unknown10m} = $self->{_io}->read_u1();
    $self->{unknown10n} = $self->{_io}->read_u1();
    $self->{unknown10o} = $self->{_io}->read_u1();
    $self->{unknown10p} = $self->{_io}->read_f8le();
    $self->{unknown10q} = $self->{_io}->read_f8le();
    $self->{unknown10r} = $self->{_io}->read_u2le();
    $self->{unknown10s} = $self->{_io}->read_u2le();
    $self->{unknown10t} = $self->{_io}->read_u1();
    $self->{unknown10u} = $self->{_io}->read_u1();
    $self->{unknown10v} = $self->{_io}->read_u1();
    $self->{elevation} = $self->{_io}->read_f8le();
    $self->{thickness} = $self->{_io}->read_f8le();
    $self->{view_point} = CAD::Format::DWG::AC1002::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{unknown_repeating} = CAD::Format::DWG::AC1002::UnknownRepeating->new($self->{_io}, $self, $self->{_root});
    $self->{unknown29} = $self->{_io}->read_s2le();
    $self->{blip} = $self->{_io}->read_s2le();
    $self->{dim_suppression_of_zeros} = $self->{_io}->read_s1();
    $self->{dim_rounding} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_extend2} = $self->{_io}->read_f8le();
    $self->{dim_arrowhead_block} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(33), 0, 0));
    $self->{circle_zoom_percent} = $self->{_io}->read_s2le();
    $self->{coordinates} = $self->{_io}->read_s2le();
    $self->{current_color} = $self->{_io}->read_s2le();
    $self->{current_linetype} = $self->{_io}->read_s2le();
    $self->{create_date_days} = $self->{_io}->read_u4le();
    $self->{create_date_ms} = $self->{_io}->read_u4le();
    $self->{update_date_days} = $self->{_io}->read_u4le();
    $self->{update_date_ms} = $self->{_io}->read_u4le();
    $self->{total_editing_time_days} = $self->{_io}->read_u4le();
    $self->{total_editing_time_ms} = $self->{_io}->read_u4le();
    $self->{user_elapsed_timer_days} = $self->{_io}->read_u4le();
    $self->{user_elapsed_timer_ms} = $self->{_io}->read_u4le();
    $self->{user_timer} = $self->{_io}->read_s2le();
    $self->{fast_zoom} = $self->{_io}->read_u2le();
    $self->{sketch_type} = $self->{_io}->read_u2le();
    $self->{unknown33b} = $self->{_io}->read_bytes(6);
    $self->{unknown34} = $self->{_io}->read_f8le();
    $self->{angle_base} = $self->{_io}->read_f8le();
    $self->{angle_direction} = $self->{_io}->read_s2le();
    $self->{point_mode} = $self->{_io}->read_s2le();
    $self->{point_size} = $self->{_io}->read_f8le();
    $self->{polyline_width} = $self->{_io}->read_f8le();
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_integer_1} = $self->{_io}->read_s2le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_integer_2} = $self->{_io}->read_s2le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_integer_3} = $self->{_io}->read_s2le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_integer_4} = $self->{_io}->read_s2le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_integer_5} = $self->{_io}->read_s2le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_real_1} = $self->{_io}->read_f8le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_real_2} = $self->{_io}->read_f8le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_real_3} = $self->{_io}->read_f8le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_real_4} = $self->{_io}->read_f8le();
    }
    if ($self->_root()->header()->num_header_vars() == 114) {
        $self->{user_real_5} = $self->{_io}->read_f8le();
    }
}

sub create_date {
    my ($self) = @_;
    return $self->{create_date} if ($self->{create_date});
    $self->{create_date} = ($self->create_date_days() + ($self->create_date_ms() / 86400000.0));
    return $self->{create_date};
}

sub update_date {
    my ($self) = @_;
    return $self->{update_date} if ($self->{update_date});
    $self->{update_date} = ($self->update_date_days() + ($self->update_date_ms() / 86400000.0));
    return $self->{update_date};
}

sub insertion_base {
    my ($self) = @_;
    return $self->{insertion_base};
}

sub num_entities {
    my ($self) = @_;
    return $self->{num_entities};
}

sub drawing_first {
    my ($self) = @_;
    return $self->{drawing_first};
}

sub drawing_second {
    my ($self) = @_;
    return $self->{drawing_second};
}

sub limits_min {
    my ($self) = @_;
    return $self->{limits_min};
}

sub limits_max {
    my ($self) = @_;
    return $self->{limits_max};
}

sub view_ctrl {
    my ($self) = @_;
    return $self->{view_ctrl};
}

sub view_size {
    my ($self) = @_;
    return $self->{view_size};
}

sub snap {
    my ($self) = @_;
    return $self->{snap};
}

sub snap_resolution {
    my ($self) = @_;
    return $self->{snap_resolution};
}

sub snap_base {
    my ($self) = @_;
    return $self->{snap_base};
}

sub snap_angle {
    my ($self) = @_;
    return $self->{snap_angle};
}

sub snap_style {
    my ($self) = @_;
    return $self->{snap_style};
}

sub snap_iso_pair {
    my ($self) = @_;
    return $self->{snap_iso_pair};
}

sub grid {
    my ($self) = @_;
    return $self->{grid};
}

sub grid_unit {
    my ($self) = @_;
    return $self->{grid_unit};
}

sub ortho {
    my ($self) = @_;
    return $self->{ortho};
}

sub regen {
    my ($self) = @_;
    return $self->{regen};
}

sub fill {
    my ($self) = @_;
    return $self->{fill};
}

sub qtext {
    my ($self) = @_;
    return $self->{qtext};
}

sub drag {
    my ($self) = @_;
    return $self->{drag};
}

sub linetype_scale {
    my ($self) = @_;
    return $self->{linetype_scale};
}

sub text_size {
    my ($self) = @_;
    return $self->{text_size};
}

sub trace_width {
    my ($self) = @_;
    return $self->{trace_width};
}

sub current_layer_index {
    my ($self) = @_;
    return $self->{current_layer_index};
}

sub current_color_convert {
    my ($self) = @_;
    return $self->{current_color_convert};
}

sub unknown6 {
    my ($self) = @_;
    return $self->{unknown6};
}

sub unknown7a {
    my ($self) = @_;
    return $self->{unknown7a};
}

sub unknown7b {
    my ($self) = @_;
    return $self->{unknown7b};
}

sub unknown7c {
    my ($self) = @_;
    return $self->{unknown7c};
}

sub unknown8 {
    my ($self) = @_;
    return $self->{unknown8};
}

sub linear_units_format {
    my ($self) = @_;
    return $self->{linear_units_format};
}

sub linear_units_precision {
    my ($self) = @_;
    return $self->{linear_units_precision};
}

sub axis {
    my ($self) = @_;
    return $self->{axis};
}

sub axis_value {
    my ($self) = @_;
    return $self->{axis_value};
}

sub sketch_increment {
    my ($self) = @_;
    return $self->{sketch_increment};
}

sub fillet_radius {
    my ($self) = @_;
    return $self->{fillet_radius};
}

sub units_for_angles {
    my ($self) = @_;
    return $self->{units_for_angles};
}

sub angular_precision {
    my ($self) = @_;
    return $self->{angular_precision};
}

sub text_style_index {
    my ($self) = @_;
    return $self->{text_style_index};
}

sub osnap {
    my ($self) = @_;
    return $self->{osnap};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

sub menu {
    my ($self) = @_;
    return $self->{menu};
}

sub dim_scale {
    my ($self) = @_;
    return $self->{dim_scale};
}

sub dim_arrowhead_size {
    my ($self) = @_;
    return $self->{dim_arrowhead_size};
}

sub dim_extension_line_offset {
    my ($self) = @_;
    return $self->{dim_extension_line_offset};
}

sub dim_baseline_spacing {
    my ($self) = @_;
    return $self->{dim_baseline_spacing};
}

sub dim_extension_line_extend {
    my ($self) = @_;
    return $self->{dim_extension_line_extend};
}

sub dim_maximum_tolerance_limit {
    my ($self) = @_;
    return $self->{dim_maximum_tolerance_limit};
}

sub dim_minimum_tolerance_limit {
    my ($self) = @_;
    return $self->{dim_minimum_tolerance_limit};
}

sub dim_text_height {
    my ($self) = @_;
    return $self->{dim_text_height};
}

sub dim_center_mark_control {
    my ($self) = @_;
    return $self->{dim_center_mark_control};
}

sub dim_oblique_stroke_size {
    my ($self) = @_;
    return $self->{dim_oblique_stroke_size};
}

sub dim_tolerances {
    my ($self) = @_;
    return $self->{dim_tolerances};
}

sub dim_limits_default_text {
    my ($self) = @_;
    return $self->{dim_limits_default_text};
}

sub dim_text_ext_inside_line_position {
    my ($self) = @_;
    return $self->{dim_text_ext_inside_line_position};
}

sub dim_text_ext_outside_line_position {
    my ($self) = @_;
    return $self->{dim_text_ext_outside_line_position};
}

sub dim_extension_line_first_suppress {
    my ($self) = @_;
    return $self->{dim_extension_line_first_suppress};
}

sub dim_extension_line_second_suppress {
    my ($self) = @_;
    return $self->{dim_extension_line_second_suppress};
}

sub dim_text_vertical_position {
    my ($self) = @_;
    return $self->{dim_text_vertical_position};
}

sub limits_check {
    my ($self) = @_;
    return $self->{limits_check};
}

sub unknown10a {
    my ($self) = @_;
    return $self->{unknown10a};
}

sub unknown10b {
    my ($self) = @_;
    return $self->{unknown10b};
}

sub unknown10c {
    my ($self) = @_;
    return $self->{unknown10c};
}

sub unknown10d {
    my ($self) = @_;
    return $self->{unknown10d};
}

sub unknown10e {
    my ($self) = @_;
    return $self->{unknown10e};
}

sub unknown10f {
    my ($self) = @_;
    return $self->{unknown10f};
}

sub unknown10g {
    my ($self) = @_;
    return $self->{unknown10g};
}

sub unknown10h {
    my ($self) = @_;
    return $self->{unknown10h};
}

sub unknown10i {
    my ($self) = @_;
    return $self->{unknown10i};
}

sub unknown10j {
    my ($self) = @_;
    return $self->{unknown10j};
}

sub unknown10k {
    my ($self) = @_;
    return $self->{unknown10k};
}

sub unknown10l {
    my ($self) = @_;
    return $self->{unknown10l};
}

sub unknown10m {
    my ($self) = @_;
    return $self->{unknown10m};
}

sub unknown10n {
    my ($self) = @_;
    return $self->{unknown10n};
}

sub unknown10o {
    my ($self) = @_;
    return $self->{unknown10o};
}

sub unknown10p {
    my ($self) = @_;
    return $self->{unknown10p};
}

sub unknown10q {
    my ($self) = @_;
    return $self->{unknown10q};
}

sub unknown10r {
    my ($self) = @_;
    return $self->{unknown10r};
}

sub unknown10s {
    my ($self) = @_;
    return $self->{unknown10s};
}

sub unknown10t {
    my ($self) = @_;
    return $self->{unknown10t};
}

sub unknown10u {
    my ($self) = @_;
    return $self->{unknown10u};
}

sub unknown10v {
    my ($self) = @_;
    return $self->{unknown10v};
}

sub elevation {
    my ($self) = @_;
    return $self->{elevation};
}

sub thickness {
    my ($self) = @_;
    return $self->{thickness};
}

sub view_point {
    my ($self) = @_;
    return $self->{view_point};
}

sub unknown_repeating {
    my ($self) = @_;
    return $self->{unknown_repeating};
}

sub unknown29 {
    my ($self) = @_;
    return $self->{unknown29};
}

sub blip {
    my ($self) = @_;
    return $self->{blip};
}

sub dim_suppression_of_zeros {
    my ($self) = @_;
    return $self->{dim_suppression_of_zeros};
}

sub dim_rounding {
    my ($self) = @_;
    return $self->{dim_rounding};
}

sub dim_extension_line_extend2 {
    my ($self) = @_;
    return $self->{dim_extension_line_extend2};
}

sub dim_arrowhead_block {
    my ($self) = @_;
    return $self->{dim_arrowhead_block};
}

sub circle_zoom_percent {
    my ($self) = @_;
    return $self->{circle_zoom_percent};
}

sub coordinates {
    my ($self) = @_;
    return $self->{coordinates};
}

sub current_color {
    my ($self) = @_;
    return $self->{current_color};
}

sub current_linetype {
    my ($self) = @_;
    return $self->{current_linetype};
}

sub create_date_days {
    my ($self) = @_;
    return $self->{create_date_days};
}

sub create_date_ms {
    my ($self) = @_;
    return $self->{create_date_ms};
}

sub update_date_days {
    my ($self) = @_;
    return $self->{update_date_days};
}

sub update_date_ms {
    my ($self) = @_;
    return $self->{update_date_ms};
}

sub total_editing_time_days {
    my ($self) = @_;
    return $self->{total_editing_time_days};
}

sub total_editing_time_ms {
    my ($self) = @_;
    return $self->{total_editing_time_ms};
}

sub user_elapsed_timer_days {
    my ($self) = @_;
    return $self->{user_elapsed_timer_days};
}

sub user_elapsed_timer_ms {
    my ($self) = @_;
    return $self->{user_elapsed_timer_ms};
}

sub user_timer {
    my ($self) = @_;
    return $self->{user_timer};
}

sub fast_zoom {
    my ($self) = @_;
    return $self->{fast_zoom};
}

sub sketch_type {
    my ($self) = @_;
    return $self->{sketch_type};
}

sub unknown33b {
    my ($self) = @_;
    return $self->{unknown33b};
}

sub unknown34 {
    my ($self) = @_;
    return $self->{unknown34};
}

sub angle_base {
    my ($self) = @_;
    return $self->{angle_base};
}

sub angle_direction {
    my ($self) = @_;
    return $self->{angle_direction};
}

sub point_mode {
    my ($self) = @_;
    return $self->{point_mode};
}

sub point_size {
    my ($self) = @_;
    return $self->{point_size};
}

sub polyline_width {
    my ($self) = @_;
    return $self->{polyline_width};
}

sub user_integer_1 {
    my ($self) = @_;
    return $self->{user_integer_1};
}

sub user_integer_2 {
    my ($self) = @_;
    return $self->{user_integer_2};
}

sub user_integer_3 {
    my ($self) = @_;
    return $self->{user_integer_3};
}

sub user_integer_4 {
    my ($self) = @_;
    return $self->{user_integer_4};
}

sub user_integer_5 {
    my ($self) = @_;
    return $self->{user_integer_5};
}

sub user_real_1 {
    my ($self) = @_;
    return $self->{user_real_1};
}

sub user_real_2 {
    my ($self) = @_;
    return $self->{user_real_2};
}

sub user_real_3 {
    my ($self) = @_;
    return $self->{user_real_3};
}

sub user_real_4 {
    my ($self) = @_;
    return $self->{user_real_4};
}

sub user_real_5 {
    my ($self) = @_;
    return $self->{user_real_5};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityArc;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{radius} = $self->{_io}->read_f8le();
    $self->{angle_from} = $self->{_io}->read_f8le();
    $self->{angle_to} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

sub angle_from {
    my ($self) = @_;
    return $self->{angle_from};
}

sub angle_to {
    my ($self) = @_;
    return $self->{angle_to};
}

########################################################################
package CAD::Format::DWG::AC1002::Entity;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_type} = $self->{_io}->read_s1();
    my $_on = $self->entity_type();
    if ($_on == $CAD::Format::DWG::AC1002::ENTITIES_SOLID) {
        $self->{data} = CAD::Format::DWG::AC1002::EntitySolid->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_SHAPE) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityShape->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_SEQEND) {
        $self->{data} = CAD::Format::DWG::AC1002::EntitySeqend->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_DIM) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityDim->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_BLOCK_BEGIN) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityBlockBegin->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_LINE) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityLine->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_LINE3D) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityLine3d->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_TEXT) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityText->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_INSERT) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityInsert->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_POLYLINE2) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityPolyline->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_CIRCLE) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityCircle->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_ARC) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityArc->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_VERTEX) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityVertex->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_FACE3D) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityFace3d->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_ATTRIB) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityAttrib->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_ATTDEF) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityAttdef->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_BLOCK_END) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityBlockEnd->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_POINT) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityPoint->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_TRACE) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityTrace->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1002::ENTITIES_POLYLINE) {
        $self->{data} = CAD::Format::DWG::AC1002::EntityPolyline->new($self->{_io}, $self, $self->{_root});
    }
    else {
        $self->{data} = CAD::Format::DWG::AC1002::EntityTmp->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_type {
    my ($self) = @_;
    return $self->{entity_type};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package CAD::Format::DWG::AC1002::EntitySeqend;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{unknown} = $self->{_io}->read_bytes(4);
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

########################################################################
package CAD::Format::DWG::AC1002::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(6);
    $self->{zeros} = $self->{_io}->read_bytes(6);
    $self->{zero_one_or_three} = $self->{_io}->read_s1();
    $self->{unknown_3} = $self->{_io}->read_s2le();
    $self->{num_sections} = $self->{_io}->read_s2le();
    $self->{num_header_vars} = $self->{_io}->read_s2le();
    $self->{dwg_version} = $self->{_io}->read_s1();
    $self->{entities_start} = $self->{_io}->read_s4le();
    $self->{entities_end} = $self->{_io}->read_s4le();
    $self->{blocks_start} = $self->{_io}->read_s4le();
    $self->{blocks_size_raw} = $self->{_io}->read_s2le();
    $self->{unknown4a} = $self->{_io}->read_bytes(2);
    $self->{blocks_end} = $self->{_io}->read_s4le();
    $self->{unknown4b} = $self->{_io}->read_bytes(2);
    $self->{unknown4c} = $self->{_io}->read_bytes(2);
    $self->{table_block} = CAD::Format::DWG::AC1002::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_layer} = CAD::Format::DWG::AC1002::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_style} = CAD::Format::DWG::AC1002::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_linetype} = CAD::Format::DWG::AC1002::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_view} = CAD::Format::DWG::AC1002::Table->new($self->{_io}, $self, $self->{_root});
    $self->{variables} = CAD::Format::DWG::AC1002::HeaderVariables->new($self->{_io}, $self, $self->{_root});
}

sub blocks_size_unknown {
    my ($self) = @_;
    return $self->{blocks_size_unknown} if ($self->{blocks_size_unknown});
    $self->{blocks_size_unknown} = (($self->blocks_size_raw() & 4278190080) >> 24);
    return $self->{blocks_size_unknown};
}

sub blocks_size {
    my ($self) = @_;
    return $self->{blocks_size} if ($self->{blocks_size});
    $self->{blocks_size} = ($self->blocks_size_raw() & 16777215);
    return $self->{blocks_size};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub zeros {
    my ($self) = @_;
    return $self->{zeros};
}

sub zero_one_or_three {
    my ($self) = @_;
    return $self->{zero_one_or_three};
}

sub unknown_3 {
    my ($self) = @_;
    return $self->{unknown_3};
}

sub num_sections {
    my ($self) = @_;
    return $self->{num_sections};
}

sub num_header_vars {
    my ($self) = @_;
    return $self->{num_header_vars};
}

sub dwg_version {
    my ($self) = @_;
    return $self->{dwg_version};
}

sub entities_start {
    my ($self) = @_;
    return $self->{entities_start};
}

sub entities_end {
    my ($self) = @_;
    return $self->{entities_end};
}

sub blocks_start {
    my ($self) = @_;
    return $self->{blocks_start};
}

sub blocks_size_raw {
    my ($self) = @_;
    return $self->{blocks_size_raw};
}

sub unknown4a {
    my ($self) = @_;
    return $self->{unknown4a};
}

sub blocks_end {
    my ($self) = @_;
    return $self->{blocks_end};
}

sub unknown4b {
    my ($self) = @_;
    return $self->{unknown4b};
}

sub unknown4c {
    my ($self) = @_;
    return $self->{unknown4c};
}

sub table_block {
    my ($self) = @_;
    return $self->{table_block};
}

sub table_layer {
    my ($self) = @_;
    return $self->{table_layer};
}

sub table_style {
    my ($self) = @_;
    return $self->{table_style};
}

sub table_linetype {
    my ($self) = @_;
    return $self->{table_linetype};
}

sub table_view {
    my ($self) = @_;
    return $self->{table_view};
}

sub variables {
    my ($self) = @_;
    return $self->{variables};
}

########################################################################
package CAD::Format::DWG::AC1002::RealEntities;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entities} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entities}}, CAD::Format::DWG::AC1002::Entity->new($self->{_io}, $self, $self->{_root});
    }
}

sub entities {
    my ($self) = @_;
    return $self->{entities};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityCircle;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{radius} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityShape;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{item_num} = $self->{_io}->read_u1();
    if ($self->entity_common()->flag2_8()) {
        $self->{angle_in_radians} = $self->{_io}->read_f8le();
    }
    $self->{load_num} = $self->{_io}->read_u1();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub item_num {
    my ($self) = @_;
    return $self->{item_num};
}

sub angle_in_radians {
    my ($self) = @_;
    return $self->{angle_in_radians};
}

sub load_num {
    my ($self) = @_;
    return $self->{load_num};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityVertex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{width} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{unknown1} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{bulge} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{unknown2} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{unknown_in_radians} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub bulge {
    my ($self) = @_;
    return $self->{bulge};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub unknown_in_radians {
    my ($self) = @_;
    return $self->{unknown_in_radians};
}

########################################################################
package CAD::Format::DWG::AC1002::LayerFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{frozen} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub frozen {
    my ($self) = @_;
    return $self->{frozen};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityMode;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode1} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_mode2} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_mode3} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_mode4} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_thickness_flag} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_elevation_flag} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_linetype_flag} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_color_flag} = $self->{_io}->read_bits_int_be(1);
}

sub entity_mode1 {
    my ($self) = @_;
    return $self->{entity_mode1};
}

sub entity_mode2 {
    my ($self) = @_;
    return $self->{entity_mode2};
}

sub entity_mode3 {
    my ($self) = @_;
    return $self->{entity_mode3};
}

sub entity_mode4 {
    my ($self) = @_;
    return $self->{entity_mode4};
}

sub entity_thickness_flag {
    my ($self) = @_;
    return $self->{entity_thickness_flag};
}

sub entity_elevation_flag {
    my ($self) = @_;
    return $self->{entity_elevation_flag};
}

sub entity_linetype_flag {
    my ($self) = @_;
    return $self->{entity_linetype_flag};
}

sub entity_color_flag {
    my ($self) = @_;
    return $self->{entity_color_flag};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityLine;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x1} = $self->{_io}->read_f8le();
    $self->{y1} = $self->{_io}->read_f8le();
    $self->{x2} = $self->{_io}->read_f8le();
    $self->{y2} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x1 {
    my ($self) = @_;
    return $self->{x1};
}

sub y1 {
    my ($self) = @_;
    return $self->{y1};
}

sub x2 {
    my ($self) = @_;
    return $self->{x2};
}

sub y2 {
    my ($self) = @_;
    return $self->{y2};
}

########################################################################
package CAD::Format::DWG::AC1002::Table;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{item_size} = $self->{_io}->read_u2le();
    $self->{items} = $self->{_io}->read_u2le();
    $self->{unknown} = $self->{_io}->read_bytes(2);
    $self->{begin} = $self->{_io}->read_u4le();
}

sub item_size {
    my ($self) = @_;
    return $self->{item_size};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub begin {
    my ($self) = @_;
    return $self->{begin};
}

########################################################################
package CAD::Format::DWG::AC1002::EntityPolyline;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC1002::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_8()) {
        $self->{closed} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{y} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub closed {
    my ($self) = @_;
    return $self->{closed};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC1002::View;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1002::ViewFlag->new($self->{_io}, $self, $self->{_root});
    $self->{view_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{view_size} = $self->{_io}->read_f8le();
    $self->{center_point} = CAD::Format::DWG::AC1002::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{view_width} = $self->{_io}->read_f8le();
    $self->{view_dir} = CAD::Format::DWG::AC1002::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{u3} = $self->{_io}->read_s2le();
    $self->{u4} = $self->{_io}->read_u1();
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub view_name {
    my ($self) = @_;
    return $self->{view_name};
}

sub view_size {
    my ($self) = @_;
    return $self->{view_size};
}

sub center_point {
    my ($self) = @_;
    return $self->{center_point};
}

sub view_width {
    my ($self) = @_;
    return $self->{view_width};
}

sub view_dir {
    my ($self) = @_;
    return $self->{view_dir};
}

sub u3 {
    my ($self) = @_;
    return $self->{u3};
}

sub u4 {
    my ($self) = @_;
    return $self->{u4};
}

1;
